from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

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

# if __name__ == '__main__':
#     app.run()