#
# addresses.py
#
# Generates random addresses for the customers and suppliers created by SSB.
#


import os
import random
import numpy as np

from shapely.geometry import Point, Polygon


'''

Read data.

'''

cities_fp = open('./data_geo/city.tbl', 'r')
customers_fp = open('./data_ssb/customer.tbl', 'r')
suppliers_fp = open('./data_ssb/supplier.tbl', 'r')
c_addresses_fp = open('./data_geo/customer_addr.tbl', 'w+')
s_addresses_fp = open('./data_geo/supplier_addr.tbl', 'w+')

cities = {}
cities_lines = cities_fp.readlines()
customers_lines = customers_fp.readlines()
suppliers_lines = suppliers_fp.readlines()

cities_fp.close()
customers_fp.close()
suppliers_fp.close()


'''

Generate polygons.

'''

for i, line in enumerate(cities_lines):

    components = line.split('|')

    c_polygons = []
    c_name = components[1]
    c_nation = components[2]

    shapes_raw = components[3][13:-1]
    shapes_components_raw = shapes_raw[1:-1].split('),(')

    for l, rsp in enumerate(shapes_components_raw):

        c_polygon = []
        c_points = rsp[1:-1].split(',')

        for point in c_points:

            k = point.split(' ')
            x = float(k[0])
            y = float(k[1])

            c_polygon.append((x, y))

        c_polygons.append(Polygon(c_polygon))

    cities[c_name] = c_polygons


'''

Generate customer's addresses.

'''

for i, line in enumerate(customers_lines):

    components = line.split('|')

    customer_address_pk = (i + 1)
    customer_pk = components[0]
    customer_city_name = components[3]
    customer_nation_name = components[4]
    customer_region_name = components[5]

    customer_city_polygons = cities[customer_city_name]
    customer_city_polygon = customer_city_polygons[0]
    minX, minY, maxX, maxY = customer_city_polygon.bounds

    while True:

        x = random.uniform(minX, maxX)
        y = random.uniform(minY, maxY)
        p = Point(x, y)

        if customer_city_polygon.contains(p):

            break

    c_addresses_fp.write(str(customer_address_pk) + '|')
    c_addresses_fp.write(str(customer_pk) + '|')
    c_addresses_fp.write(customer_city_name + '|')
    c_addresses_fp.write(customer_nation_name + '|')
    c_addresses_fp.write(customer_region_name + '|')
    c_addresses_fp.write('POINT(' + str(x) + ', ' + str(y) + ')' + '|\n')


'''

Generate supplier's addresses.

'''

for i, line in enumerate(suppliers_lines):

    components = line.split('|')

    supplier_address_pk = (i + 1)
    supplier_pk = components[0]
    supplier_city_name = components[3]
    supplier_nation_name = components[4]
    supplier_region_name = components[5]

    supplier_city_polygons = cities[supplier_city_name]
    supplier_city_polygon = supplier_city_polygons[0]
    minX, minY, maxX, maxY = supplier_city_polygon.bounds

    while True:

        x = random.uniform(minX, maxX)
        y = random.uniform(minY, maxY)
        p = Point(x, y)

        if supplier_city_polygon.contains(p):

            break

    s_addresses_fp.write(str(supplier_address_pk) + '|')
    s_addresses_fp.write(str(supplier_pk) + '|')
    s_addresses_fp.write(supplier_city_name + '|')
    s_addresses_fp.write(supplier_nation_name + '|')
    s_addresses_fp.write(supplier_region_name + '|')
    s_addresses_fp.write('POINT(' + str(x) + ' ' + str(y) + ')' + '|\n')


'''

Close file pointers.

'''

c_addresses_fp.close()
s_addresses_fp.close()
