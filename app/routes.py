from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.database import SessionLocal
from app.models import User
from app.models import Products
from app.models import Sales

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
