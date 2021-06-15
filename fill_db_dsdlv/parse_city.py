with open("villes.txt", "r+") as f:
    lines = f.readlines()
    parsed_file = []

    cities = []

    for line in lines:
        parsed_file.append(line.split(","))

    for t in parsed_file:
        t[3] = t[3].strip('"')
        cities.append(t[3])

with open("list_of-cities.py", "w+") as f:
    f.write("cities = ")

with open("list_of-cities.py", "a+") as f:
    f.write(str(cities))