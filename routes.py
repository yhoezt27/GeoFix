from app import app
from app.controller import be_pythonController
from flask import request

@app.route('/data_all', methods=['POST', 'GET'])
def data_all():
    if request.method == 'GET':
        return be_pythonController.index()
    else:
        return be_pythonController.store()

@app.route('/data_all/<name>', methods=['PUT', 'GET', 'DELETE'])
def data_name(name):
    if request.method == 'GET':
        return be_pythonController.show(name)
    elif request.method == 'PUT':
        return be_pythonController.update(name)
    elif request.method == 'DELETE':
        return be_pythonController.delete(name)



