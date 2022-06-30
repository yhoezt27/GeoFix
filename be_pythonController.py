from array import array
from app.model.be_python import Be_python
from app import response, db
from flask import jsonify, request

def index():
    try:
        data_all = Be_python.query.all()
        data = transform(data_all)
        return response.ok(data, "")
    except Exception as e:
        print(e)

def transform(data_all):
    array = []
    for i in data_all:
       array.append(singleTransform(i))
    return array

def show(name):
    try:
        data_name = Be_python.query.filter_by(name=name).first()
        if not data_name:
            return response.badRequest([], 'Empty....')

        data = singleTransform(data_name)
        return response.ok(data, "")
    except Exception as e:
        print(e)

def singleTransform(data_name):
    data = {
        'id': data_name.id,
        'name': data_name.name,
        'latitude': data_name.latitude,
        'longtude': data_name.longtude 
    }

    return data

def store():
    try:
        name = request.json['name']
        longtude = request.json['longtude']
        latitude = request.json['latitude']

        dataGeo = Be_python(name=name, longtude=longtude, latitude=latitude)
        dataGeo.setGeo(longtude, latitude)
        db.session.add(dataGeo)
        db.session.commit()

        return response.ok('', 'Successfully create data!')

    except Exception as e:
        print(e)

def update(name):
    try:
        name = request.json['name']
        longtude = request.json['longtude']
        latitude = request.json['latitude']

        data_name = Be_python.query.filter_by(name=name).first()
        data_name.name = name
        data_name.longtude = longtude
        data_name.latitude = latitude
        data_name.setGeo(longtude, latitude)

        db.session.commit()

        return response.ok('', 'Successfully update data!')

    except Exception as e:
        print(e)

def delete(name):
    try:
        data_name = Be_python.query.filter_by(name=name).first()
        if not data_name:
            return response.badRequest([], 'Empty....')

        db.session.delete(data_name)
        db.session.commit()

        return response.ok('', 'Successfully delete data!')
    except Exception as e:
        print(e)

