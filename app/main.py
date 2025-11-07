from fastapi import FastAPI
from app.routers import incident_router

app = FastAPI()

app.include_router(incident_router.router, prefix="/api")