#
# merge.py
#
# ...
#


from shutil import copyfile


'''

Read data.

'''

cities_fp = open('./data_geo/city.tbl', 'r')
nations_fp = open('./data_geo/nation.tbl', 'r')
regions_fp = open('./data_geo/region.tbl', 'r')
c_addr_fp = open('./data_geo/customer_addr.tbl', 'r')
s_addr_fp = open('./data_geo/supplier_addr.tbl', 'r')

cities_lines = cities_fp.readlines()
nations_lines = nations_fp.readlines()
regions_lines = regions_fp.readlines()
customer_addr_lines = c_addr_fp.readlines()
supplier_addr_lines = s_addr_fp.readlines()

cities_fp.close()
nations_fp.close()
regions_fp.close()
c_addr_fp.close()
s_addr_fp.close()


'''

Create lookup tables for the cities, nations and regions's primary keys.

'''

geo_lookup = []

for lines in [cities_lines, nations_lines, regions_lines]:

    geo_lookup.append({})

    for line in lines:

        components = line.split('|')

        pk = components[0]
        name = components[1]

        geo_lookup[-1][name] = pk

cities = geo_lookup[0]
nations = geo_lookup[1]
regions = geo_lookup[2]


'''

Create lookups for the customers and suppliers addresses's primary keys.

'''

addresses_lookup = []

for lines in [customer_addr_lines, supplier_addr_lines]:

    addresses_lookup.append({})

    for line in lines:

        components = line.split('|')

        address_pk = components[0]
        customer_pk = components[1]

        addresses_lookup[-1][customer_pk] = address_pk

c_addresses = addresses_lookup[0]
s_addresses = addresses_lookup[1]


'''

Update the customer's addresses table and the supplier's addresses table.
Remove the customer's/supplier's primary keys and city names.

'''

w_customers_fp = open('./data_ssb_geo/customer_addr.tbl', 'w+')

for line in customer_addr_lines:

    components = line.split('|')

    address_pk = components[0]
    address_geometry = components[2]

    w_customers_fp.write(address_pk + '|' + address_geometry + '|\n')

w_customers_fp.close()

w_suppliers_fp = open('./data_ssb_geo/supplier_addr.tbl', 'w+')

for line in supplier_addr_lines:

    components = line.split('|')

    address_pk = components[0]
    address_geometry = components[2]

    w_suppliers_fp.write(address_pk + '|' + address_geometry + '|\n')

w_suppliers_fp.close()


'''

Update the city, nation and region tables. Remove some columns, leaving only
the primary key and the geometry information.

'''

paths = [
    ('./data_ssb_geo/city.tbl', cities_lines),
    ('./data_ssb_geo/nation.tbl', nations_lines),
    ('./data_ssb_geo/region.tbl', regions_lines)
]

for path, lines in paths:

    fp = open(path, 'w+')

    for line in lines:

        components = line.split('|')

        pk = components[0]
        geometry = components[-2]

        fp.write(pk + '|' + geometry + '|\n')

    fp.close()


'''

Update customer table. Add foreign keys for the customer's address, city,
nation and region.

'''

w_customers_fp = open('./data_ssb_geo/customer.tbl', 'w+')

r_customers_fp = open('./data_ssb/customer.tbl', 'r')
r_customers_lines = r_customers_fp.readlines()
r_customers_fp.close()

for i, line in enumerate(r_customers_lines):

    components = line.split('|')

    customer_pk = components[0]
    customer_city_name = components[3]
    customer_nation_name = components[4]
    customer_region_name = components[5]

    customer_address_pk = c_addresses[customer_pk]
    customer_city_pk = cities[customer_city_name]
    customer_nation_pk = nations[customer_nation_name]
    customer_region_pk = regions[customer_region_name]

    newline = line[:-1]
    newline += str(customer_address_pk) + '|'
    newline += str(customer_city_pk) + '|'
    newline += str(customer_nation_pk) + '|'
    newline += str(customer_region_pk) + '|'
    newline += '\n'

    w_customers_fp.write(newline)

w_customers_fp.close()


'''

Update customer table. Add foreign keys for the customer's address, city,
nation and region.

'''

w_suppliers_fp = open('./data_ssb_geo/supplier.tbl', 'w+')

r_suppliers_fp = open('./data_ssb/supplier.tbl', 'r')
r_suppliers_lines = r_suppliers_fp.readlines()
r_suppliers_fp.close()

for i, line in enumerate(r_suppliers_lines):

    components = line.split('|')

    supplier_pk = components[0]
    supplier_city_name = components[3]
    supplier_nation_name = components[4]
    supplier_region_name = components[5]

    supplier_address_pk = s_addresses[supplier_pk]
    supplier_city_pk = cities[supplier_city_name]
    supplier_nation_pk = nations[supplier_nation_name]
    supplier_region_pk = regions[supplier_region_name]

    newline = line[:-1]
    newline += str(supplier_address_pk) + '|'
    newline += str(supplier_city_pk) + '|'
    newline += str(supplier_nation_pk) + '|'
    newline += str(supplier_region_pk) + '|'
    newline += '\n'

    w_suppliers_fp.write(newline)

w_suppliers_fp.close()


'''

Copy the lineorder, part and date tables to the merged files folder.

'''

copyfile('./data_ssb/lineorder.tbl', './data_ssb_geo/lineorder.tbl')
copyfile('./data_ssb/part.tbl', './data_ssb_geo/part.tbl')
copyfile('./data_ssb/date.tbl', './data_ssb_geo/date.tbl')
