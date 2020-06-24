
import re
import sys
import happybase

sys.stdout.write('\n' * 4)
sys.stdout.write('\033[F' * 3)

file = open('/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_hbase/ROB-M12/generic_table.txt', 'r')

#for i, l in enumerate(file): pass
#lcount = i
#file.seek(0, 0)
lcount = 444086654

connection = happybase.Connection(host='localhost')
connection.open()

errors = []

line = file.readline()
table_name = line.split('\'')[1::2][0]
table = connection.table(table_name)

for i, line in enumerate(file):

    components = line.split('\'')[1::2]
    rowkey = components[1]
    qualifiers = bytes(components[2], 'utf-8')
    data = components[3]

    row = table.row(rowkey)

    if len(row.keys()) == 0:

        errors.append({
            'rowkey': rowkey
        })

        #print('rowkey: ' + rowkey)
        #x = input()

    elif qualifiers not in row:

        errors.append({
            'rowkey': rowkey,
            'qualifiers': qualifiers
        })

        #print('rowkey: ' + rowkey)
        #print('qualifiers: ' + qualifiers.decode('utf-8'))
        #x = input()

    else:

        val = row[qualifiers].decode('utf-8')

        if val != data:

            errors.append({
                'rowkey': rowkey,
                'val': val,
                'data': data
            })

            #print('rowkey: ' + rowkey)
            #print('qualifiers: ' + qualifiers.decode('utf-8'))
            #print('val: ' + val)
            #print('data: ' + data)
            #x = input()

    log = 'Line: ' + str(i+1) + '/' + str(lcount) + '.' + (10 * ' ') + '\n'
    log += 'Errors: ' + str(len(errors))  + '.' + (10 * ' ') + '\n'

    sys.stdout.write(log)
    sys.stdout.write('\033[F' * 2)

sys.stdout.write('\n' * 3)

for error in errors:

    print(error)

file.close()
connection.close()
