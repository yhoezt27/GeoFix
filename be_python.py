from app import db
from sqlalchemy import func
from geoalchemy2 import Geometry

class Be_python(db.Model):

    __tablename__ = 'be_python'
    __table_args__ = {'schema': 'geofix'}

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(30), nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longtude = db.Column(db.Float, nullable=False)
    geo = db.Column(Geometry(geometry_type="POINT", srid=4326, spatial_index=False), nullable=True)

    def __repr__(self):
        return "<Be_python {name} ({lon}, {lat})>".format(name=self.name, lon=self.longtude, lat=self.latitude)
    
    def setGeo(self, longtude, latitude):
        self.geo =  func.ST_SetSRID(func.ST_POINT(longtude, latitude), 4326)
        
        