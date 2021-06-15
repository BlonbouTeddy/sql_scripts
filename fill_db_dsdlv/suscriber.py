from dataclasses import dataclass
from main import db

@dataclass
class Subscriber(db.Model):
    """
    """
    __tablename__ = "subscriber"

    id: int
    firstname: str
    address: str
    cp: str
    city: str
    region: str

    civility: str
    firstname: str
    lastname: str
    birthdate: str

    tel: str
    tel2: str
    email: str

    comment: str

    consistency: int
    hearing: int
    housing: int
    mobility: int
    speech: int
    view: int

    familystatus: int
    status: int

    healthstatus: str

    origincomment: str
    origindate: str

    platform_id: int

    reference: str
    reference2: str

    assigndate: str
    terminatedate: str

    convention_id: int

    origin_id: int

    user_id: int

    id = db.Column(db.Integer, primary_key=True, unique=True)

    address = db.Column(db.String(255))
    cp = db.Column(db.String(255))
    city = db.Column(db.String(255))
    region = db.Column(db.String(255))

    civility = db.Column(db.Integer)
    firstname = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    birthdate = db.Column(db.Text)

    tel = db.Column(db.String(255))
    tel2 = db.Column(db.String(255))
    email = db.Column(db.String(255))

    comment = db.Column(db.Text)

    consistency = db.Column(db.Integer)
    hearing = db.Column(db.Integer)
    housing = db.Column(db.Integer)
    mobility = db.Column(db.Integer)
    speech = db.Column(db.Integer)
    view = db.Column(db.Integer)

    familystatus = db.Column(db.Integer)
    status = db.Column(db.Integer)

    healthstatus = db.Column(db.Text)

    origincomment = db.Column(db.Text)
    origindate = db.Column(db.Text)

    platform_id = db.Column(db.Integer)

    reference = db.Column(db.String(255))
    reference2 = db.Column(db.String(255))

    assigndate = db.Column(db.Text)
    terminatedate = db.Column(db.Text)

    convention_id = db.Column(db.Integer)

    origin_id = db.Column(db.Integer)

    user_id = db.Column(db.Integer)