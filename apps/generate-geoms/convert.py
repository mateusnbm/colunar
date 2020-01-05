#
# convert.py
#

import unidecode
import shapefile

input_path = 'shapefiles/'
output_path = 'csvs/'

'''
input_file_path = input_path + 'brazil.shp'
output_file_path = output_path + 'brazil.csv'
attributes_raw = ['ISO', 'NAME_ISO']
attributes_alias = ['ISO', 'NAME', 'GEOM']
'''

'''
input_file_path = input_path + 'brazil-states.shp'
output_file_path = output_path + 'brazil-states.csv'
attributes_raw = ['NAME_1', 'ISO', 'NAME_0']
attributes_alias = ['NAME', 'COUNTRY_ISO', 'COUNTRY_NAME', 'GEOM']
'''

'''
input_file_path = input_path + 'usa.shp'
output_file_path = output_path + 'usa.csv'
attributes_raw = ['ISO', 'NAME_ISO']
attributes_alias = ['ISO', 'NAME', 'GEOM']
'''

#'''
input_file_path = input_path + 'usa-states.shp'
output_file_path = output_path + 'usa-states.csv'
attributes_raw = ['NAME_1', 'ISO', 'NAME_0']
attributes_alias = ['NAME', 'COUNTRY_ISO', 'COUNTRY_NAME', 'GEOM']
#'''

input_file = shapefile.Reader(input_file_path)
output_file = open(output_file_path, 'w')

output_file.write(','.join(attributes_alias) + '\n')

fields = input_file.fields[1:]
field_names = [field[0] for field in fields]

for sr in input_file.shapeRecords():

    attributes = dict(zip(field_names, sr.record))
    attributes = [unidecode.unidecode(attributes[name].upper()) for name in attributes_raw]

    wkt_geom = []
    geometry = sr.shape.__geo_interface__
    type = geometry['type']
    polygons = geometry['coordinates']
    polygons = polygons if type == 'MultiPolygon' else [polygons]

    for polygon in polygons:

        coordinates = [(str(lat) + ' ' + str(lon)) for lat, lon in polygon[0]]
        wkt_polygon = '(' + ', '.join(coordinates) + ')'
        wkt_geom.append(wkt_polygon)

    output_file.write(','.join(attributes))
    output_file.write(',polygon(' + ', '.join(wkt_geom) + ')\n')

output_file.close()
