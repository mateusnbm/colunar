
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

file = open('/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_hbase/DLA-CF/t-small.txt', 'r')

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

'''
import struct
quantity = struct.pack(">i", 155190)
print(quantity)
table = connection.table(table_name)
table.put(b'row-key', {b'A:boolean': formatted_data('1', 'boolean') })
table.put(b'row-key', {b'A:byte': formatted_data(64, 'byte') })
table.put(b'row-key', {b'A:short': b'\x00\x12'}) #formatted_data(16900, 'short') })
table.put(b'row-key', {b'A:int': quantity }) #formatted_data(155190, 'int') })
table.put(b'row-key', {b'A:long': formatted_data(155190, 'long') })
table.put(b'row-key', {b'A:string': formatted_data('Zorro', 'string') })
row = table.row(b'row-key')
print(row)
file.close()
connection.close()
exit()
'''

#print(table_name)
#print(families)
#file.close()
#connection.close()
#exit()

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

for i, line in enumerate(file):

    components = line.split('\'')[1::2]
    rowkey = components[1]
    qualifiers = components[2]
    data = components[3]
    datatype = components[4]

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
