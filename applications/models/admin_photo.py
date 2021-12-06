import datetime
from applications.extensions import db


class Photo(db.Model):
    __tablename__ = 'admin_photo'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    href = db.Column(db.String(255))
    mime = db.Column(db.CHAR(200), nullable=False)
    size = db.Column(db.CHAR(30), nullable=False)
    city = db.Column(db.String(200))
    create_time = db.Column(db.DateTime, default=datetime.datetime.now)