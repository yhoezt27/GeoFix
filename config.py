import os


basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    
    HOST = str(os.environ.get("DB_HOST"))
    DATABASE = str(os.environ.get("DB_DATABASE"))
    USERNAME = str(os.environ.get("DB_USERNAME"))
    PASSWORD = str(os.environ.get("DB_PASSWORD"))
    SCHEMA = str(os.environ.get("DB_SCHEMA"))

    DB_URL = 'postgresql+psycopg2://{user}:{pw}@{url}/{db}?options=-c%20 search_path={sc}'.format(user=USERNAME,pw=PASSWORD,url=HOST,db=DATABASE, sc=SCHEMA)

    SQLALCHEMY_DATABASE_URI = DB_URL
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_RECORD_QUERIES = True