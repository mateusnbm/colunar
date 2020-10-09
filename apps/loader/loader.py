
import re
import sys
import time
import struct
import happybase

def pp_time(n):
    h = int(n/3600)
    m = int((n-(h*3600))/60)
    s = int(n-(h*3600)-(m*60))
    return '{:02d}:{:02d}:{:02d}'.format(h, m, s)

def formatted_data(d, t):
    if t == 'string':
        return d
    else:
        return struct.pack(">i", int(d))

sys.stdout.write('\n' * 4)
sys.stdout.write('\033[F' * 3)

file = open(sys.argv[1], 'r')

#path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_hbase/M4-B-G1'
#path = '/Volumes/Mateus/COLUNAR-SF-1/M4/M4-B-G3'

#file = open('/Volumes/Mateus/COLUNAR-SF-1/M4/a.txt', 'r')

#file = open(path + '/a.txt', 'r')
#file = open(path + '/b.txt', 'r')
#file = open(path + '/c.txt', 'r')
#file = open(path + '/d.txt', 'r')
#file = open(path + '/e.txt', 'r')
#file = open(path + '/f.txt', 'r')
#file = open(path + '/g.txt', 'r')
#file = open(path + '/h.txt', 'r')
#file = open(path + '/i.txt', 'r')
#file = open(path + '/j.txt', 'r')

for i, l in enumerate(file): pass
lcount = i
file.seek(0, 0)

connection = happybase.Connection(host='localhost')
connection.open()

families = {}
line = file.readline()
components = line.split('\'')[1::2]
table_name = components[0]
families_names = components[1:]
for family in families_names:
    families[family] = {}
connection.create_table(table_name, families)

line = file.readline()
components = line.split('\'')[1::2]
table_name = components[0]
rowkey = components[1]
qualifiers = components[2]
data = components[3]
datatype = components[4]

lrowkey = rowkey
ldata = {qualifiers: formatted_data(data, datatype)}

table = connection.table(table_name)
batch = table.batch(batch_size=1000)

abs_time = time.monotonic()

last_rowkey = rowkey
last_cf_name = qualifiers.split(':')[0]
last_c_name = qualifiers.split(':')[1]
last_c_datatype = datatype

for i, line in enumerate(file):

    #if i > 10000: break

    components = line.split('\'')[1::2]
    rowkey = components[1]
    qualifiers = components[2]
    family = qualifiers.split(':')[0]
    column = qualifiers.split(':')[1]
    data = components[3]
    datatype = components[4]

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

    if lrowkey == rowkey:

        ldata[qualifiers] = formatted_data(data, datatype)

    else:

        batch.put(lrowkey, ldata)
        lrowkey = rowkey
        ldata = {qualifiers: formatted_data(data, datatype)}

    diff = time.monotonic()-abs_time
    log = 'Line: ' + '{:,}'.format(i+2) + '/' + '{:,}'.format(lcount) + '.' + (10 * ' ') + '\n'
    log = log + 'Elapsed time: ' + pp_time(diff) + '.' + (10 * ' ') + '\n'

    sys.stdout.write(log)
    sys.stdout.write('\033[F' * 2)

batch.put(lrowkey, ldata)
batch.send()

file.close()
connection.close()

sys.stdout.write('\n' * 3)
