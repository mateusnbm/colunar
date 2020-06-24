
import os

input_file = open('/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_hbase/ROB-M12/generic_table.txt', 'r')
output_file = open('/Users/mateusnbm/Desktop/workspace/colunar/apps/generate/data_hbase/ROB-M12/generic_table_formatted.txt', 'w+')

for line in input_file:

    if len(line.strip()) == 0: continue

    output_file.write(line)

output_file.seek(output_file.tell()-1)
output_file.truncate()

input_file.close()
output_file.close()
