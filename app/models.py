#from xmlrpc.client import DateTime
from sqlalchemy import Column, Integer, String, DateTime,Numeric, ForeignKey
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    user_name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True, nullable=False)

class Products(Base):
    __tablename__ = "products"
    id = Column(Integer, primary_key=True, index=True)
    product_name = Column(String(100), nullable=False)
    stock = Column(Integer)
    category_id = Column(Integer, nullable=False)

class Sales(Base):
    __tablename__ = "sales"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey('users.id'), nullable=False)
    product_id = Column(Integer,ForeignKey('products.id'), nullable=False)
    quantity = Column(Integer)
    amount = Column(Numeric(10, 2))
    day = Column(DateTime, nullable=False)