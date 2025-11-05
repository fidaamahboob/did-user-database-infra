import os
import json
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import User

# DB connection string
DB_USER = os.environ['DB_USER']
DB_PASSWORD = os.environ['DB_PASSWORD']
DB_HOST = os.environ['DB_HOST']
DB_NAME = os.environ['DB_NAME']
DB_PORT = os.environ.get('DB_PORT', 3306)

DATABASE_URL = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

# Create SQLAlchemy engine and session
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)

def lambda_handler(event, context):
    session = SessionLocal()
    try:
        # Query all users
        users = session.query(User).all()
        user_list = [
            {
                "id": u.id,
                "first_name": u.first_name,
                "last_name": u.last_name,
                "date_of_birth": u.date_of_birth.isoformat() if u.date_of_birth else None,
                "is_active": u.is_active
            }
            for u in users
        ]

        return {
            "statusCode": 200,
            "body": json.dumps(user_list),
            "headers": {"Content-Type": "application/json"}
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)}),
            "headers": {"Content-Type": "application/json"}
        }

    finally:
        session.close()
