from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, Integer, String, DateTime
from datetime import datetime, timezone

Base = declarative_base()

class IncidentModel(Base):
    __tablename__ = "incidents"

    id = Column(Integer, primary_key=True, index=True)
    desc = Column(String(500), nullable=False)
    status = Column(String(20), nullable=False)
    source = Column(String(20), nullable=False)
    reported_at = Column(DateTime(timezone=True), nullable=False, default=datetime.now(timezone.utc))