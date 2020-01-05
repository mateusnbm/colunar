#
# format.py
#
# Extracts data from the sql code that generates the cities, nations and
# regions tables. Then, this data is written to three separate files matching
# the same format used on SSB tables.
#


import os
import json


'''

Something.

'''

cities_in_fp = open('./scripts/cities.sql', 'r')
nations_in_fp = open('./scripts/nations.sql', 'r')
regions_in_fp = open('./scripts/regions.sql', 'r')

cities_out_fp = open('./data_geo/cities.tbl', 'w+')
nations_out_fp = open('./data_geo/nations.tbl', 'w+')
regions_out_fp = open('./data_geo/regions.tbl', 'w+')

cities_lines = cities_in_fp.readlines()
nations_lines = nations_in_fp.readlines()
regions_lines = regions_in_fp.readlines()

cities_in_fp.close()
nations_in_fp.close()
regions_in_fp.close()


'''

Something.

'''

cities_lines = cities_lines[3:]
nations_lines = nations_lines[3:]
regions_lines = regions_lines[3:]

for i, line in enumerate(cities_lines):

    if len(line) < 10: continue

    data = line[69:-2]
    data = data.split(',')

    city_pk = data[0]
    city_name = data[1][1:-1]
    nation_name = data[2][1:-1]
    city_geo = ','.join(data[3:])[16:-6][1:-1]

    cities_out_fp.write(city_pk + '|')
    cities_out_fp.write(city_name + '|')
    cities_out_fp.write(nation_name + '|')
    cities_out_fp.write(city_geo + '|')
    cities_out_fp.write('\n')

for i, line in enumerate(nations_lines):

    if len(line) < 10: continue

    data = line[77:-2]
    data = data.split(',')

    nation_pk = data[0]
    nation_name = data[1][1:-1]
    region_name = data[2][1:-1]
    nation_geo = ','.join(data[3:])[13:-6][1:-1]

    nations_out_fp.write(nation_pk + '|')
    nations_out_fp.write(nation_name + '|')
    nations_out_fp.write(region_name + '|')
    nations_out_fp.write(nation_geo + '|')
    nations_out_fp.write('\n')

for i, line in enumerate(regions_lines):

    if len(line) < 10: continue

    data = line[65:-2]
    data = data.split(',')

    region_pk = data[0]
    region_name = data[1][1:-1]
    region_geo = ','.join(data[2:])[13:-6][1:-1]

    regions_out_fp.write(region_pk + '|')
    regions_out_fp.write(region_name + '|')
    regions_out_fp.write(region_geo + '|')
    regions_out_fp.write('\n')


'''

Something.

'''

cities_out_fp.close()
nations_out_fp.close()
regions_out_fp.close()
