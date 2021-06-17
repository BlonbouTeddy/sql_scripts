from dataclasses import dataclass
from main import db

@dataclass
class User(db.Model):
    """
    """
    __tablename__ = "user"

    id: int
    enabled: int
    last_login: str
    password: str
    platform_id: int
    roles: str
    username: str

    id = db.Column(db.Integer, primary_key=True, unique=True)
    enabled = db.Column(db.Integer)
    last_login = db.Column(db.String(255))
    password = db.Column(db.String(255))
    platform_id = db.Column(db.Integer)
    roles = db.Column(db.String(255))
    username = db.Column(db.String(255))