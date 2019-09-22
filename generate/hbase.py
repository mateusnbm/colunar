#
# hbase.py
#


import os
import json


'''

Somehting.

'''

def determineRowKey(table, data):

    table_name_ssb = table['table_name_ssb']
    table_rk = ""
    table_rk_prefix = table['table_row_key']['prefix']
    table_rk_components = table['table_row_key']['components']
    table_column_families = table['table_column_families_data']

    if table_rk_prefix is not None:

        table_rk += (table_rk_prefix + "+")

    for component in table_rk_components:

        c_cf_name = component['cf_name']
        c_column_index = component['column_index']

        cf = [x for x in table_column_families if x['column_f_name'] == c_cf_name][0]
        c = cf['column_f_columns'][c_column_index]

        c_name = c['column_name']
        c_ssb_table_name = c['ssb_table_name']
        c_ssb_column_index = c['ssb_column_index']

        if c_ssb_table_name == table_name_ssb:

            table_rk += str(data[c_ssb_column_index])+'+'

        else:

            table_rk +='NOT_IMPLEMENTED'

    return table_rk[:-1]


'''

Load the JSON file containing the HBase databases specification.

'''

tf_file = open('hbase.json', 'r')
tf_data = json.load(tf_file)


'''

Load the SSB table files.

All tables, except the date table, use an integer as primary key
and this number matches the line in which the record sits, thus,
we can use this information to retrieve rows referenced by a PK.

Since the primary keys of the date table are differnte, we create
a key-value map to translate PK into line indexes.

'''

ssb_date_tbl_kmap = {}
ssb_tables = {}
ssb_tables_name = ['lineorder', 'date', 'customer', 'supplier', 'part']

for name in ssb_tables_name:

    ssb_filename = ('./data_ssb/' + name + '.tbl')
    ssb_file = open(ssb_filename, 'r')

    ssb_tables[name] = ssb_file.readlines()

    ssb_file.close()

for i, line in enumerate(ssb_tables['date']):

    ssb_date_tbl_kmap[int(line.split('|')[0])] = i


'''

Let's perform each transformation specified.

We'll read a HBase database specification and produce code to
setup the database tables and code to populate them.

'''

for transform in tf_data:

    transform_id = transform['transform_id']
    transform_path = ('./data_hbase/' + transform_id + '/')
    transform_tables = transform['transform_tables']

    '''
    The outputs of each transformation are saved on a specific
    data folder, on each run, we delete and recreate the folder.
    '''

    os.system('rm -rf ' + transform_path)
    os.system('mkdir ' + transform_path)

    '''
    Generate code to create the tables and populate them.
    '''

    for table in transform_tables:

        table_name = table['table_name']
        table_name_ssb = table['table_name_ssb']
        table_column_families_data = table['table_column_families_data']
        table_rk_surrogate = table['table_row_key']['surrogate']

        hb_filepath = transform_path + table_name + '.txt'
        hb_file_exists = os.path.exists(hb_filepath)
        hb_file = open(hb_filepath, 'a+')

        if hb_file_exists == False:

            families = table['table_column_families']
            families = [(', \''+ cf +'\'') for cf in families]

            hb_file.write('\ncreate \'' + table_name +'\'' + ' '.join(families) + '\n\n')

        for i, line in enumerate(ssb_tables[table_name_ssb]):

            data = line.split('|')
            rowkey = str(i) if table_rk_surrogate == True else determineRowKey(table, data)
            cmdprefix = 'put \'' + table_name + '\', \'' + rowkey + '\', '

            for cf in table_column_families_data:

                cf_name = cf['column_f_name']
                cf_columns = cf['column_f_columns']

                for c in cf_columns:

                    c_name = c['column_name']
                    c_ssb_table_name = c['ssb_table_name']
                    c_ssb_column_index = c['ssb_column_index']

                    if c_ssb_table_name == table_name_ssb:

                        c_data = data[c_ssb_column_index]

                    else:

                        c_fk_table = ssb_tables[c_ssb_table_name]
                        c_fk_index = c["column_fk_index"]
                        c_fk_value = data[c_fk_index]
                        c_fk_line_index = int(c_fk_value)

                        if c_ssb_table_name == 'date':

                            c_fk_line_index = ssb_date_tbl_kmap[c_fk_line_index]
                            c_fk_line_index = int(c_fk_line_index)

                        else:

                            c_fk_line_index -= 1

                        c_fk_row = c_fk_table[c_fk_line_index]
                        c_fk_data = c_fk_row.split('|')
                        c_data = c_fk_data[c_ssb_column_index]

                    if "column_value_prefix" in c:

                        c_value_prefix = c["column_value_prefix"]
                        c_data = (c_value_prefix + "+" + c_data)

                    c_cmd = cmdprefix
                    c_cmd += '\'' + (cf_name + ':' + c_name) + '\', '
                    c_cmd += '\'' + c_data + '\''
                    c_cmd += '\n'

                    hb_file.write(c_cmd)

            hb_file.write('\n')

            #if i == 0: break

        hb_file.close()

        #break

    tf_file.close()

    #break
