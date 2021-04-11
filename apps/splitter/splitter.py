#
# splitter.py
#
# python3 splitter.py ./input.txt ./output_folder/filename 5000
#

import re
import sys

input_file = sys.argv[1]
output_path = sys.argv[2]
maximum_size_bytes = int(sys.argv[3])

ifile = open(input_file, 'r')
ofile = open((output_path + '-0.txt'), 'w')

# First line, creates table.

line = ifile.readline()
components = line.split('\'')[1::2]
table_name = components[0]
families_names = components[1:]

ofile.write(line)

# Second line, inserts data.

line = ifile.readline()
components = line.split('\'')[1::2]
table_name = components[0]
rowkey = components[1]
qualifiers = components[2]
data = components[3]
datatype = components[4]

ofile.write(line)

last_table_name = table_name
last_rowkey = rowkey
last_cf_name = qualifiers.split(':')[0]
last_c_name = qualifiers.split(':')[1]
last_c_datatype = datatype

# Remaining lines, divide among other files.

batch_id = 0
batch_size_bytes = 0

for i, line in enumerate(ifile):

    components = line.split('\'')[1::2]
    table_name = components[0]
    rowkey = components[1]
    qualifiers = components[2]
    family = qualifiers.split(':')[0]
    column = qualifiers.split(':')[1]
    data = components[3]
    datatype = components[4]

    #print(components)
    #exit()

    if table_name == '':
        table_name = last_table_name
    else:
        last_table_name = table_name

    if rowkey == '':
        rowkey = last_rowkey
    else:
        last_rowkey = rowkey

    if family == '':
        family = last_cf_name
    else:
        last_cf_name = family

    if column == '':
        column = last_c_name
    else:
        last_c_name = column

    if datatype == '':
        datatype = last_c_datatype
    else:
        last_c_datatype = datatype

    qualifiers = family + ':' + column

    if batch_size_bytes < maximum_size_bytes:

        ofile.write(line)
        batch_size_bytes = batch_size_bytes + len(line)

    else:

        batch_id = batch_id + 1
        batch_size_bytes = 0
        ofile.close()
        ofile = open((output_path + '-' + str(batch_id) + '.txt'), 'w')

        newline = 'put '
        newline = newline + '\'' + table_name + '\', '
        newline = newline + '\'' + rowkey + '\', '
        newline = newline + '\'' + qualifiers + '\', '
        newline = newline + '\'' + data + '\', '
        newline = newline + '\'' + datatype + '\''
        newline = newline + '\n'

        ofile.write(newline)
        batch_size_bytes = batch_size_bytes + len(newline)

ifile.close()
ofile.close()
