#
# transform.py
#


import os
import sys
import json
import time

'''

Something.

'''

def pp_db_size(n):
    if n < 1001:
        return ('{:.2f}'.format(round(n, 2)) + ' bytes')
    elif n < 1000001:
        return ('{:.2f}'.format(round((n/1000), 2)) + ' kilobytes')
    elif n < 1000000001:
        return ('{:.2f}'.format(round((n/1000000), 2)) + ' megabytes')
    else:
        return ('{:.2f}'.format(round((n/1000000000), 2)) + ' gigabytes')

'''

Something.

'''

def pp_time(n):
    h = int(n/3600)
    m = int((n-(h*3600))/60)
    s = int(n-(h*3600)-(m*60))
    return '{:02d}:{:02d}:{:02d}'.format(h, m, s)


'''

Somehting.

'''

def readTableLine(table_name, row_pk):

    index = ssb_date_tbl_kmap[int(row_pk)] if table_name == 'date' else (int(row_pk)-1)

    return ssb_tables[table_name][index]

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

            table_rk += 'NOT_IMPLEMENTED'

    return table_rk[:-1]


'''

Somehting.

'''

window_rows, window_columns = os.popen('stty size', 'r').read().split()

sys.stdout.write('\n' * 8)
sys.stdout.write('\033[F' * 7)


'''

Load the JSON file containing the HBase databases specification.

'''

tf_file = open('./models/compare-no-geo/NLA.json', 'r')
tf_data = json.load(tf_file)


'''

Load the SSB table files.

All tables, except the date table, use an integer as primary key
and this number matches the line in which the record sits, thus,
we can use this information to retrieve rows referenced by a PK.

Since the primary keys of the date table are different, we create
a key-value map to translate primary keys into line indexes.

'''

ssb_date_tbl_kmap = {}
ssb_tables = {}
ssb_tables_name = [
    'lineorder',
    'date',
    'customer',
    'supplier',
    'part',
    'city',
    'nation',
    'region',
    'customer_addr',
    'supplier_addr'
    ]

for name in ssb_tables_name:

    ssb_filename = ('./data_ssb_geo/' + name + '.tbl')
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

for transform_i, transform in enumerate(tf_data):

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

    up_count = 0
    db_bytes = 0
    abs_time = time.monotonic()

    for table_i, table in enumerate(transform_tables):

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

            hb_file.write('create \'' + table_name +'\'' + ' '.join(families) + '\n')

        for i, line in enumerate(ssb_tables[table_name_ssb]):

            #if i > 4999: break

            data = line.split('|')
            rowkey = str(i) if table_rk_surrogate == True else determineRowKey(table, data)
            cmdprefix = 'put \'' + table_name + '\', \'' + rowkey + '\', '

            for cf_i, cf in enumerate(table_column_families_data):

                cf_name = cf['column_f_name']
                cf_columns = cf['column_f_columns']

                for c_i, c in enumerate(cf_columns):

                    c_name = c['column_name']
                    c_datatype = c['column_datatype']
                    c_ssb_table_name = c['ssb_table_name']
                    c_ssb_column_index = c['ssb_column_index']

                    if c_ssb_table_name == table_name_ssb:

                        c_data = data[c_ssb_column_index]

                    else:

                        c_join_tables = c["join_tables"][::-1]
                        c_index = c_join_tables[0]['c_index']
                        c_join_pk = data[c_index]

                        for join in c_join_tables[1:]:

                            iter_c_table = join['c_table']
                            iter_c_index = join['c_index']

                            iter_line = readTableLine(iter_c_table, c_join_pk)
                            iter_attrs = iter_line.split('|')

                            c_join_pk = iter_attrs[iter_c_index]

                        c_fk_row = readTableLine(c_ssb_table_name, c_join_pk)
                        c_fk_data = c_fk_row.split('|')
                        c_data = c_fk_data[c_ssb_column_index]

                    if "column_value_prefix" in c:

                        c_value_prefix = c["column_value_prefix"]
                        c_data = (c_value_prefix + "+" + c_data)

                    '''
                    Write the HBase command to the file.
                    '''

                    c_cmd = cmdprefix
                    c_cmd += '\'' + (cf_name + ':' + c_name) + '\', '
                    c_cmd += '\'' + c_data + '\', '
                    c_cmd += '\'' + c_datatype + '\''
                    c_cmd += '\n'

                    hb_file.write(c_cmd)

                    '''
                    Log progress status.
                    '''

                    c_log = 'Transform: ' + str(transform_i+1) + '/' + str(len(tf_data)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Table: ' + str(table_i+1) + '/' + str(len(transform_tables)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Line: ' + str(i+1) + '/' + str(len(ssb_tables[table_name_ssb])) + '.' + (10 * ' ') + '\n'
                    c_log += 'Family: ' + str(cf_i+1) + '/' + str(len(table_column_families_data)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Column: ' + str(c_i+1) + '/' + str(len(cf_columns)) + '.' + (10 * ' ') + '\n'

                    db_bytes += len(c_cmd)
                    current_time = time.monotonic()

                    c_log += 'Size: ' + pp_db_size(db_bytes) + '.' + (10 * ' ') + '\n'
                    c_log += 'Elapsed time: ' + pp_time(current_time-abs_time) + '.' + (10 * ' ') + '\n'

                    sys.stdout.write(c_log)
                    sys.stdout.write('\033[F' * 7)

                #hb_file.write('\n')

            #hb_file.write('\n')

            #if i == 0: break

        hb_file.close()

        #break

    tf_file.close()

    #break

    sys.stdout.write('\n' * 8)
