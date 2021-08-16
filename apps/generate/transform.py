#
# transform.py
#
# python3 transform.py ./models/roberio/M1/M1-C-G2.json ./data_hbase/M1CG2/ 0
#


import os
import sys
import json
import time

DEBUG_MODE = False
COUNT_MODE = False

model_path = sys.argv[1]
destination_path = sys.argv[2]
skip_lineorder = int(sys.argv[3])

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
        c_datatype = c['column_datatype']
        c_ssb_table_name = c['ssb_table_name']
        c_ssb_column_index = c['ssb_column_index']

        if c_ssb_table_name == table_name_ssb:

            table_rk += str(data[c_ssb_column_index])+'+'

        else:

            c_join_tables = c['join_tables'][::-1]
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

            if 'column_value_prefix' in c:

                c_value_prefix = c["column_value_prefix"]
                c_data = (c_value_prefix + "+" + c_data)

            table_rk += c_data+'+'

    return table_rk[:-1]


'''

Somehting.

'''

window_rows, window_columns = os.popen('stty size', 'r').read().split()

sys.stdout.write('\n' * 8)
sys.stdout.write('\033[F' * 7)


'''

Load the JSON file containing the HBase schema specification.

'''

tf_file = open(model_path, 'r')
tf_data = json.load(tf_file)
tf_file.close()


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
    transform_path = destination_path
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

    last_table_name = ''
    last_rowkey = ''
    last_cf_name = ''
    last_c_name = ''
    last_c_datatype = ''

    # Iteramos sobre a lista de tabelas. Podemos passar por tabelas com o
    # mesmo nome, neste caso, os dados são armazenados na mesma tabela já
    # existente mas em linhas diferentes (normalização em tabela única).

    for table_i, table in enumerate(transform_tables):

        table_name = table['table_name']
        table_name_ssb = table['table_name_ssb']
        table_column_families_data = table['table_column_families_data']
        table_rk_surrogate = table['table_row_key']['surrogate']

        #print(table_name)

        if skip_lineorder == 1:
            if table_name_ssb == 'lineorder': continue

        # Se não existir um arquivo para a tabela, adicionamos o comando para
        # a criação da tabela no HBase (nome da tabela e lista de famílias).

        hb_filepath = transform_path + table_name + '.txt'
        hb_file_exists = os.path.exists(hb_filepath)
        hb_file = open(hb_filepath, 'a+')

        if hb_file_exists == False and COUNT_MODE == False:

            families = table['table_column_families']
            families = [(', \''+ cf +'\'') for cf in families]

            hb_file.write('create \'' + table_name +'\'' + ' '.join(families) + '\n')

        # ...

        for i, line in enumerate(ssb_tables[table_name_ssb]):

            data = line.split('|')
            rowkey = str(i) if table_rk_surrogate == True else determineRowKey(table, data)
            cmdprefix = 'put \'' + table_name + '\', \'' + rowkey + '\', '

            for cf_i, cf in enumerate(table_column_families_data):

                cf_name = cf['column_f_name']
                cf_columns = cf['column_f_columns']

                #print(cf_name)

                for c_i, c in enumerate(cf_columns):

                    c_disposable = False
                    c_name = c['column_name']
                    c_datatype = c['column_datatype']
                    c_ssb_table_name = c['ssb_table_name']
                    c_ssb_column_index = c['ssb_column_index']

                    if 'column_disposable' in c:

                        c_disposable = c['column_disposable'] and not DEBUG_MODE

                    if c_ssb_table_name == table_name_ssb:

                        if 'ssb_column_indexes' not in c:

                            c_data = data[c_ssb_column_index]

                        else:

                            c_data = ''

                            for multi_index in c['ssb_column_indexes']:

                                c_data += data[multi_index]+'+'

                            c_data = c_data[:-1]

                    else:

                        c_join_tables = c['join_tables'][::-1]
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

                    if 'column_value_prefix' in c:

                        c_value_prefix = c["column_value_prefix"]
                        c_data = (c_value_prefix + "+" + c_data)

                    '''
                    Write the HBase command to the file.
                    '''

                    if c_disposable == False:

                        cmd_table_name = table_name
                        cmd_rowkey = rowkey
                        cmd_cf_name = cf_name
                        cmd_c_name = c_name
                        cmd_c_datatype = c_datatype

                        if table_name == last_table_name:
                            cmd_table_name = ''
                        else:
                            last_table_name = table_name
                        if rowkey == last_rowkey:
                            cmd_rowkey = ''
                        else:
                            last_rowkey = rowkey
                        if cf_name == last_cf_name:
                            cmd_cf_name = ''
                        else:
                            last_cf_name = cf_name
                        if c_name == last_c_name:
                            cmd_c_name = ''
                        else:
                            last_c_name = c_name
                        if c_datatype == last_c_datatype:
                            cmd_c_datatype = ''
                        else:
                            last_c_datatype = c_datatype

                        c_cmd = 'put \'' + cmd_table_name + '\', \'' + cmd_rowkey + '\', '
                        c_cmd += '\'' + (cmd_cf_name + ':' + cmd_c_name) + '\', '
                        c_cmd += '\'' + c_data + '\', '
                        c_cmd += '\'' + cmd_c_datatype + '\''
                        c_cmd += '\n'

                        db_bytes += len(c_data) if c_datatype == 'string' else 4

                        if COUNT_MODE == False:

                            hb_file.write(c_cmd)

                    '''
                    Log progress status.
                    '''

                    c_log = 'Transform: ' + str(transform_i+1) + '/' + str(len(tf_data)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Table: ' + str(table_i+1) + '/' + str(len(transform_tables)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Line: ' + str(i+1) + '/' + str(len(ssb_tables[table_name_ssb])) + '.' + (10 * ' ') + '\n'
                    c_log += 'Family: ' + str(cf_i+1) + '/' + str(len(table_column_families_data)) + '.' + (10 * ' ') + '\n'
                    c_log += 'Column: ' + str(c_i+1) + '/' + str(len(cf_columns)) + '.' + (10 * ' ') + '\n'

                    current_time = time.monotonic()

                    c_log += 'Size: ' + pp_db_size(db_bytes) + '.' + (10 * ' ') + '\n'
                    c_log += 'Elapsed time: ' + pp_time(current_time-abs_time) + '.' + (10 * ' ') + '\n'

                    sys.stdout.write(c_log)
                    sys.stdout.write('\033[F' * 7)

                #hb_file.write('\n')

            #hb_file.write('\n')

            #if i == 5: break

        hb_file.close()

        #break

    sys.stdout.write('\n' * 8)
