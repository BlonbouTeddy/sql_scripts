import random
from list_of_names import names
import time
import datetime
from list_of_cities import cities
from suscriber import Subscriber

def generate_score():
    return random.randrange(0, 4)

def get_platform_id():
    return random.randrange(1, 4)

def generate_civility():
    return random.randrange(0, 2)

def parse_name_list():
    names = []

    with open("list_of_names.txt", 'r+') as f:
        lines = f.readlines()
        for l in lines:
            parsed_line = l.split(',')
            parsed_line = parsed_line[1]
            parsed_line = parsed_line.strip('"')
            names.append(parsed_line)

    with open("list_of_names.py", 'w+') as f:
        f.write("names = ")

    with open("list_of_names.py", 'a+') as f:
        f.write(str(names))

def get_name():
    index = random.randrange(0, (names.__len__() - 1))

    return names[index]

def get_phone_number():
    phone_number = '06'

    for i in range(0, 7):
        phone_number += str(random.randrange(0, 9))
    
    return phone_number

def get_date():
    def str_time_prop(start, end, time_format, prop):
        """Get a time at a proportion of a range of two formatted times.

        start and end should be strings specifying times formatted in the
        given format (strftime-style), giving an interval [start, end].
        prop specifies how a proportion of the interval to be taken after
        start.  The returned time will be in the specified format.
        """

        stime = time.mktime(time.strptime(start, time_format))
        etime = time.mktime(time.strptime(end, time_format))

        ptime = stime + prop * (etime - stime)

        return time.strftime(time_format, time.localtime(ptime))


    def random_date(start, end, prop):
        return str_time_prop(start, end, '%m/%d/%Y %I:%M %p', prop)
        
    date = random_date("1/1/1970 1:30 PM", "1/1/2010 4:50 AM", random.random())
    
    dt_obj = datetime.datetime.strptime(date, '%m/%d/%Y %I:%M %p')
    return dt_obj

def get_cp():
    cp = ''
    for i in range(0, 5):
        cp += str(random.randrange(0, 9))
    
    return cp

def get_city():
    index = random.randrange(0, (cities.__len__() - 1))

    return cities[index]

def get_address():
    prefixes = ["rue de ", "impasse de ", "place de ", "square de "]

    address = prefixes[random.randrange(0, (prefixes.__len__() - 1))] + names[random.randrange(0, (names.__len__() - 1))]

    return address

def get_email():
    name = names[random.randrange(0, (names.__len__() - 1))]
    location = cities[random.randrange(0, (cities.__len__() - 1))]
    suffixe = "@email.fr"

    return str(name + "." + location + suffixe)


from main import db

for i in range(0, 500):

    s = Subscriber(
        address = get_address(),
        birthdate = get_date(),
        city = get_city(),
        civility = generate_civility(),
        consistency = generate_score(),
        cp = get_cp(),
        email = get_email(),
        familystatus = random.randint(0,1),
        firstname = get_name(),
        healthstatus = generate_score(),
        hearing = generate_score(),
        housing = generate_score(),
        lastname = get_name(),
        mobility = generate_score(),
        reference = get_name(),
        speech = generate_score(),
        tel = get_phone_number(),
        tel2 = get_phone_number(),
        view = generate_score(),
        status = 1,
        platform_id = get_platform_id(),
        convention_id = get_platform_id()
    )
    
    db.session.add(s)
    db.session.commit()
