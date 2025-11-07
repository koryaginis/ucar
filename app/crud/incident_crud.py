from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
from pydantic import PositiveInt
from app.models import IncidentModel
from app.schemas import IncidentBaseSchema, IncidentSchema, IncidentUpdateSchema, StatusSchema

async def create_incident(incident_data: IncidentBaseSchema, db: AsyncSession) -> IncidentSchema:
    """
    Создает новый инцидент.
    """
    db_incident = IncidentModel(
        desc=incident_data.desc,
        status=incident_data.status,
        source=incident_data.source
    )

    db.add(db_incident)
    await db.commit()
    await db.refresh(db_incident)

    return IncidentSchema.model_validate(db_incident)

async def get_incidents_by_status(incident_status: StatusSchema, db: AsyncSession):
    """
    Получает из БД все инциденты с указанным статусом.
    """
    result = await db.execute(select(IncidentModel).where(IncidentModel.status == incident_status))
    db_incidents = result.scalars().all()

    if db_incidents is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Incidents with status {status} not found."
        )

    return [IncidentSchema.model_validate(incidents) for incidents in db_incidents]

async def update_incident(incident_id: PositiveInt, update_data: IncidentUpdateSchema, db: AsyncSession):
    """
    Обновляет в БД статус инцидента по id.
    """
    result = await db.execute(select(IncidentModel).where(IncidentModel.id == incident_id))
    db_incident = result.scalar_one_or_none()

    if db_incident is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Incident with id {incident_id} not found."
        )
    
    for field, value in update_data.model_dump(exclude_unset=True).items():
        setattr(db_incident, field, value)

    db.add(db_incident)
    await db.commit()
    await db.refresh(db_incident)

    return IncidentSchema.model_validate(db_incident)
