from suscriber import Subscriber
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# FULL_DB_URL = "mysql://b336c0cb38e7c5:97184676@eu-cdbr-west-01.cleardb.com/heroku_e4bee02313f3859"

host = "vps-f7b5701d.vps.ovh.net"
user = "root"
password = ""
database = "dusoleil"
uri = "mysql+pymysql://" + user + ":" + password + "@" + host + "/" + database

app.config['MYSQL_HOST'] = host
app.config['MYSQL_USER'] = user
app.config['MYSQL_PASSWORD'] = password
app.config['MYSQL_DB'] = database

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = uri

db = SQLAlchemy(app)

s = Subscriber()

r = s.query.all()

print(r)