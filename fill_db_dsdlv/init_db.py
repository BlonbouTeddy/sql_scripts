from suscriber import Subscriber
# FULL_DB_URL = "mysql://b336c0cb38e7c5:97184676@eu-cdbr-west-01.cleardb.com/heroku_e4bee02313f3859"

s = Subscriber()

r = s.query.all()

print(r.__len__())