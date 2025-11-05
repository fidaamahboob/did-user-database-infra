from sqlalchemy import Column, Integer, String, Date, Boolean, TIMESTAMP, func
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(100), unique=True, nullable=False)
    last_name = Column(String(100), unique=True, nullable=False)
    date_of_birth = Column(Date, nullable=True)
    created_at = Column(TIMESTAMP, server_default=func.current_timestamp())
    updated_at = Column(TIMESTAMP, server_default=func.current_timestamp(), onupdate=func.current_timestamp())
    is_active = Column(Boolean, default=True)

    def __repr__(self):
        return f"<User(id={self.id}, name={self.first_name} {self.last_name}, active={self.is_active})>"
