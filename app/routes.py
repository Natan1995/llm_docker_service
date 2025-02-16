from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import text
from app.database import SessionLocal
from app.models import User, Products, Sales
from typing import List

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/users")
def get_users(db: Session = Depends(get_db)):
    return db.query(User).all()

@router.get("/products")
def get_products(db: Session = Depends(get_db)):
    return db.query(Products).all()

@router.get("/sales")
def get_sales(db: Session = Depends(get_db)):
    return db.query(Sales).all()      

# ✅ Nueva función para ejecutar consultas SQL dinámicas
@router.get("/query/")
def execute_query(query: str = Query(..., title="SQL Query", description="Consulta SQL tipo SELECT"), db: Session = Depends(get_db)):
    """
    Ejecuta una consulta SQL en formato string y devuelve los resultados en JSON.
    Se restringe a solo consultas SELECT para evitar cambios en la base de datos.
    """
    try:
        # Validar que solo se ejecuten consultas SELECT
        if not query.strip().lower().startswith("select"):
            raise HTTPException(status_code=403, detail="Solo se permiten consultas SELECT")

        # Ejecutar la consulta SQL
        result = db.execute(text(query))

        # Convertir los resultados a lista de diccionarios
        data = [dict(row) for row in result.mappings()]

        return {"status": "success", "data": data}

    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Error en la consulta: {str(e)}")
