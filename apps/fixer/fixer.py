#
# fixer.py
#
# python3 fixer.py
#

from shapely.geometry import Point, Polygon

c_source_path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/download/tmp/SF1/M4/M4-X-XX/'
e_source_path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/download/tmp/SF1/M4/M4-B-G1/'
destination_path = './'

lineorder_source =  c_source_path + 'a.txt'
date_source =       e_source_path + 'b.txt'
customer_source =   e_source_path + 'c.txt'
supplier_source =   e_source_path + 'd.txt'
part_source =       e_source_path + 'e.txt'
cust_addr_source =  e_source_path + 'f.txt'
supp_addr_source =  e_source_path + 'g.txt'
city_source =       e_source_path + 'h.txt'
nation_source =     e_source_path + 'i.txt'
region_source =     e_source_path + 'j.txt'

lineorder_destination =     destination_path + 'linerorder.tbl'
date_destination =          destination_path + 'date.tbl'
customer_destination =      destination_path + 'customer.tbl'
supplier_destination =      destination_path + 'supplier.tbl'
part_destination =          destination_path + 'part.tbl'
cust_addr_destination =     destination_path + 'customer_addr.tbl'
supp_addr_destination =     destination_path + 'supplier_addr.tbl'
city_destination =          destination_path + 'city.tbl'
nation_destination =        destination_path + 'nation.tbl'
region_destination =        destination_path + 'region.tbl'

################################################################################
# Lineorder ####################################################################
################################################################################

'''
data = []

linerorder_r_file = open(lineorder_source, 'r')
linerorder_w_file = open(lineorder_destination, 'w')

for i, line in enumerate(linerorder_r_file):

    if i == 0: continue

    data.append(line.split(',')[-2][2:-1])

    if i % 17 != 0: continue

    linerorder_w_file.write('|'.join(data) + '|\n')

    data = []

linerorder_r_file.close()
linerorder_w_file.close()
'''

################################################################################
# Date #########################################################################
################################################################################

'''
data = []

date_r_file = open(date_source, 'r')
date_w_file = open(date_destination, 'w')

for i, line in enumerate(date_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 17 != 0: continue

    date_w_file.write('|'.join(data) + '|\n')

    data = []

date_r_file.close()
date_w_file.close()
'''

################################################################################
# Customer #####################################################################
################################################################################

'''
data = []

customer_r_file = open(customer_source, 'r')
customer_w_file = open(customer_destination, 'w')

for i, line in enumerate(customer_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 12 != 0: continue

    customer_w_file.write('|'.join(data) + '|\n')

    data = []

customer_r_file.close()
customer_w_file.close()
'''

################################################################################
# Supplier #####################################################################
################################################################################

'''
data = []

supplier_r_file = open(supplier_source, 'r')
supplier_w_file = open(supplier_destination, 'w')

for i, line in enumerate(supplier_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 11 != 0: continue

    supplier_w_file.write('|'.join(data) + '|\n')

    data = []

supplier_r_file.close()
supplier_w_file.close()
'''

################################################################################
# Part #########################################################################
################################################################################

'''
data = []

part_r_file = open(part_source, 'r')
part_w_file = open(part_destination, 'w')

for i, line in enumerate(part_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 9 != 0: continue

    part_w_file.write('|'.join(data) + '|\n')

    data = []

part_r_file.close()
part_w_file.close()
'''

################################################################################
# Customer Address #############################################################
################################################################################

'''
data = []
customer = {}

customer_r_file = open(customer_source, 'r')
customer_addr_r_file = open(cust_addr_source, 'r')
customer_addr_w_file = open(cust_addr_destination, 'w')

for i, line in enumerate(customer_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 12 != 0: continue

    addr_id = data[-4]
    city_id = data[-3]
    nation_id = data[-2]
    region_id = data[-1]

    customer[addr_id] = {'cty': city_id, 'nat': nation_id, 'reg': region_id}

    data = []

for i, line in enumerate(customer_addr_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 2 != 0: continue

    customer_addr_w_file.write(data[0] + '|')
    customer_addr_w_file.write(customer[data[0]]['cty'] + '|')
    customer_addr_w_file.write(customer[data[0]]['nat'] + '|')
    customer_addr_w_file.write(customer[data[0]]['reg'] + '|')
    customer_addr_w_file.write(data[1] + '|\n')

    data = []

customer_r_file.close()
customer_addr_r_file.close()
customer_addr_w_file.close()
'''

################################################################################
# Supplier Address #############################################################
################################################################################

'''
data = []
supplier = {}

supplier_r_file = open(supplier_source, 'r')
supplier_addr_r_file = open(supp_addr_source, 'r')
supplier_addr_w_file = open(supp_addr_destination, 'w')

for i, line in enumerate(supplier_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 11 != 0: continue

    addr_id = data[-4]
    city_id = data[-3]
    nation_id = data[-2]
    region_id = data[-1]

    supplier[addr_id] = {'cty': city_id, 'nat': nation_id, 'reg': region_id}

    data = []

for i, line in enumerate(supplier_addr_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 2 != 0: continue

    supplier_addr_w_file.write(data[0] + '|')
    supplier_addr_w_file.write(supplier[data[0]]['cty'] + '|')
    supplier_addr_w_file.write(supplier[data[0]]['nat'] + '|')
    supplier_addr_w_file.write(supplier[data[0]]['reg'] + '|')
    supplier_addr_w_file.write(data[1] + '|\n')

    data = []

supplier_r_file.close()
supplier_addr_r_file.close()
supplier_addr_w_file.close()
'''

################################################################################
# Region #######################################################################
################################################################################

'''
data = []

region_r_file = open(region_source, 'r')
region_w_file = open(region_destination, 'w')

for i, line in enumerate(region_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 2 != 0: continue

    region_w_file.write('|'.join(data) + '|\n')

    data = []

region_r_file.close()
region_w_file.close()
'''

################################################################################
# Nation #######################################################################
################################################################################

#'''
data = []
regions = []

region_r_file = open(region_source, 'r')
nation_r_file = open(nation_source, 'r')
nation_w_file = open(nation_destination, 'w')

for i, line in enumerate(region_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 2 != 0: continue

    c_polygons = []
    region_id = data[0]
    region_geo = data[1]

    shapes_raw = region_geo[13:-1]
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

    regions.append({'id': data[0], 'geo': c_polygons})

    data = []

for i, line in enumerate(nation_r_file):

    if i == 0: continue

    data.append(line.split('\', \'')[-2])

    if i % 2 != 0: continue

    matches = []
    nation_id = data[0]
    nation_geo = data[1]

    for region in regions:

        for geo in region['geo']:

            if geo.contains()

    data = []

    break

region_r_file.close()
nation_r_file.close()
nation_w_file.close()
#'''
