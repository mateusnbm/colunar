#
# trimmer.py
#

import os
import re
import csv
import sys

truthtable_path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/compiler/truthtable/'

for k in range(0, 7):

    input_file = open((truthtable_path + 'Q' + str(k+1) + '.csv'), 'r')
    output_file = open((truthtable_path + 'Q' + str(k+1) + '-trimmed.csv'), 'w')

    reader = csv.reader(input_file)
    writer = csv.writer(output_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    for row in reader:

        line = [x.strip() for x in row]

        writer.writerow(line)

    input_file.close()
    output_file.close()





