#
# hbase.py
#

import sys
import csv

csv.field_size_limit(sys.maxsize)

states_file = open('finals/states.csv', 'r')
states_output = open('hbase/states.txt', 'w+')
states_csv = csv.reader(states_file, delimiter=',')

countries_file = open('finals/countries.csv', 'r')
countries_output = open('hbase/countries.txt', 'w+')
countries_csv = csv.reader(countries_file, delimiter=',')

states_output.write("create 'states', 'cf'\n\n")
countries_output.write("create 'countries', 'cf'\n\n")

for row in states_csv:

    key = row[1] + '+' + row[0].replace(' ', '-')

    data = [
        ['NAME', row[0]],
        ['COUNTRY_ISO', row[1]],
        ['COUNTRY_NAME', row[2]],
        ['GEOM', row[3]]
    ]

    for column, value in data:

        cmd = "put 'states', '" + key + "', 'cf:" + column + "', '" + value + "'\n"

        states_output.write(cmd)

    states_output.write('\n')

for row in countries_csv:

    key = row[0]

    data = [
        ['ISO', row[0]],
        ['NAME', row[1]],
        ['GEOM', row[2]]
    ]

    for column, value in data:

        cmd = "put 'countries', '" + key + "', 'cf:" + column + "', '" + value + "'\n"

        countries_output.write(cmd)

    countries_output.write('\n')

states_file.close()
states_output.close()
countries_file.close()
countries_output.close()
