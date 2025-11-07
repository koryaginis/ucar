from __future__ import annotations
from datetime import datetime, timezone
from pydantic import BaseModel, PositiveInt, ConfigDict, Field, constr
from typing import Optional
from enum import Enum
from datetime import datetime

class StatusSchema(str, Enum):
    OPENED = "OPENED" # Создан
    IN_PROGRESS = "IN_PROGRESS" # В работе
    RESOLVED = "RESOLVED" # Проблема устранена
    CLOSED = "CLOSED" # Закрыт

class SourceSchema(str, Enum):
    OPERATOR = "OPERATOR" # Сообщение от оператора
    MONITORING = "MONITORING" # Система мониторинга
    PARTNER = "PARTNER" # Партнер / сторонняя компания
    USER = "USER" # Пользователь приложения
    MANUAL = "MANUAL" # Ручной ввод админом

class IncidentBaseSchema(BaseModel):
    desc: str = constr(strip_whitespace=True, max_length=500)
    status: StatusSchema = Field(description="Статус инцидента")
    source: SourceSchema = Field(description="Источник инцидента")

    model_config = ConfigDict(from_attributes=True)

class IncidentSchema(IncidentBaseSchema):
    id: PositiveInt = Field(description="Идентификатор инцидента")
    reported_at: datetime = Field(description="Время создания инцидента")

class IncidentUpdateSchema(BaseModel):
    status: Optional[StatusSchema] = Field(description="Статус инцидента", default=None)

    model_config = ConfigDict(from_attributes=True)