#
# compiler.py
#
# python3 compiler.py SF1 M4CG1
#

import os
import re
import csv
import sys
import datetime
import subprocess

results_path = '/home/mateus/results/raw/'
#results_path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/compiler/'
#truthtable_path = '/Users/mateusnbm/Desktop/workspace/colunar/apps/compiler/truthtable/'

scale_factor = sys.argv[1]
model_name = sys.argv[2]
model_name_p0 = model_name[0:2]
model_name_p1 = model_name[2:3]
model_name_p2 = model_name[3:5]

if scale_factor == 'SF1':

    truthtable_path = '/home/mateus/results/truthtable/SF1/'

elif scale_factor == 'SF10':
    
    truthtable_path = '/home/mateus/results/truthtable/SF10/'

times_loads_file = open((results_path + model_name + '/times-loads.txt'), 'r')
times_queries_file = open((results_path + model_name + '/times-queries.txt'), 'r')
output_file = open((results_path + model_name + '/' + model_name.replace('-', '') +'-RESULTS.txt'), 'w')

names = []
loads = []
load_p0 = None
load_p1 = None

header = True
lookup = {'Q1':[], 'Q2':[], 'Q3':[], 'Q4':[], 'Q5':[], 'Q6':[], 'Q7':[], }

if model_name_p0 == 'M3' or model_name_p0 == 'M4':

    tmp_file = open((results_path + (model_name_p0 + 'XXX') + '/times-loads.txt'), 'r')

    lines = tmp_file.read().splitlines()
    lines.reverse()

    for line in lines:

        if len(line.strip()) > 0:

            source_filename = 'a.txt'
            load_time = line.split(':')
            h = int(load_time[0])*3600
            m = int(load_time[1])*60
            s = int(load_time[2])
            time_secs = h + m + s

            names.append(source_filename.strip())
            loads.append(time_secs)

            break

    tmp_file.close()

for i, line in enumerate(times_loads_file):

    if len(line.strip()) > 0:

        if load_p0 == None: 
            
            load_p0 = line
        
        elif load_p1 == None: 
            
            load_p1 = line
        
        else:
        
            source_filename = load_p0.split('/')[-1]
            load_time = line.split(':')
            h = int(load_time[0])*3600
            m = int(load_time[1])*60
            s = int(load_time[2])
            time_secs = h + m + s

            names.append(source_filename.strip())
            loads.append(time_secs)

            load_p0 = None
            load_p1 = None

for i, line in enumerate(times_queries_file):

    if re.search('TIME Q[1-7] [0-9]+', line) or re.search('Time taken: [0-9]+ ms', line):

        components = line.strip().split(' ')

        if header == True: 
            query = components[1] 
        else: 
            time = components[2]
            lookup[query].append(time)

        header = not header

output_file.write(model_name + '\n')
output_file.write(str(datetime.datetime.now()) + '\n')
output_file.write('\n')

output_file.write('***************************************************************************\n')
output_file.write('******************************** LOADS (ms) *******************************\n')
output_file.write('***************************************************************************\n')
output_file.write('\n')
output_file.write('FILENAME ----TIME\n')
output_file.write('\n')

for i, name in enumerate(names):

    output_file.write(names[i].center(8) + ' ')
    output_file.write(str(loads[i]*1000).rjust(8) + ' ')
    output_file.write('\n')

output_file.write('\n')
output_file.write(' TOTAL   ')
output_file.write(str(sum(loads)*1000).rjust(8) + ' ')
output_file.write('\n')

output_file.write('\n')
output_file.write('***************************************************************************\n')
output_file.write('******************************* SIZES (MB) ********************************\n')
output_file.write('***************************************************************************\n')
output_file.write('\n')
output_file.write('------------------------------------PATH ------SIZE\n')
output_file.write('\n')

size_total = 0
p = subprocess.Popen("hdfs dfs -du -h  /user/mateus/hbase/data/default/", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[0]

for line in p.decode('utf-8').split('\n')[:-1]:

    components = line.split(' ')
    num = float(components[0])
    unit = components[1]
    table = components[-1]

    if unit == 'G':
        num = num * 1000
    elif unit == 'K':
        num = num / 1000 
    elif unit != 'M':
        print ('BAD UNIT: ' + unit)

    size_total += num

    output_file.write(table.rjust(40) + ' ')
    output_file.write('{:.2f}'.format(num).rjust(10) + ' ')
    output_file.write('\n')

output_file.write('\n')
output_file.write('TOTAL'.rjust(40) + ' ')
output_file.write('{:.2f}'.format(size_total).rjust(10) + ' ')
output_file.write('\n')

output_file.write('\n')
output_file.write('***************************************************************************\n')
output_file.write('******************************* QUERIES (ms) ******************************\n')
output_file.write('***************************************************************************\n')
output_file.write('\n')
output_file.write('ROUND -------Q1 -------Q2 -------Q3 -------Q4 -------Q5 -------Q6 -------Q7\n')
output_file.write('\n')

for i in range(0, len(lookup['Q1'])):

    output_file.write(str(i+1).center(5) + ' ')
    output_file.write(lookup['Q1'][i].rjust(9) + ' ')
    output_file.write(lookup['Q2'][i].rjust(9) + ' ')
    output_file.write(lookup['Q3'][i].rjust(9) + ' ')
    output_file.write(lookup['Q4'][i].rjust(9) + ' ')
    output_file.write(lookup['Q5'][i].rjust(9) + ' ')
    output_file.write(lookup['Q6'][i].rjust(9) + ' ')
    output_file.write(lookup['Q7'][i].rjust(9) + ' ')
    output_file.write('\n')

output_file.write('\n')
output_file.write(' AVG  ')
output_file.write(str(int(sum([int(x) for x in lookup['Q1']])/len(lookup['Q1']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q2']])/len(lookup['Q2']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q3']])/len(lookup['Q3']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q4']])/len(lookup['Q4']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q5']])/len(lookup['Q5']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q6']])/len(lookup['Q6']))).rjust(9) + ' ')
output_file.write(str(int(sum([int(x) for x in lookup['Q7']])/len(lookup['Q7']))).rjust(9) + ' ')

output_file.write('\n')
output_file.write('\n')
output_file.write('***************************************************************************\n')
output_file.write('****************************** RESULTS CHECK ******************************\n')
output_file.write('***************************************************************************\n')
output_file.write('\n')
output_file.write('ROUND -------Q1 -------Q2 -------Q3 -------Q4 -------Q5 -------Q6 -------Q7\n')
output_file.write('\n')

results_truth_table = []

for k in range(0, 7):

    ttfpath = truthtable_path + 'Q' + str(k+1) + '.csv'
    ttfile = open(ttfpath, 'r')

    results_truth_table.append([])

    for line in ttfile:

        results_truth_table[k].append(line)

    ttfile.close()

for i in range(0, len(lookup['Q1'])):

    v = []

    for k in range(0, 7):

        matches = True

        cmpfpath = results_path + model_name + '/Q' + str(k+1) + '-' + str(i+1) + '/'
        cmpfpath = cmpfpath + [f for f in os.listdir(cmpfpath) if f.endswith('.csv')][0]
        cmpfile = open(cmpfpath, 'r')

        for index, line in enumerate(cmpfile):

            if results_truth_table[k][index] != line:

                matches = False

                break

        if matches: 
            v.append('---------') 
        else: 
            v.append('ERROR')

        cmpfile.close()

    output_file.write(str(i+1).center(5) + ' ')
    output_file.write(v[0].rjust(9) + ' ')
    output_file.write(v[1].rjust(9) + ' ')
    output_file.write(v[2].rjust(9) + ' ')
    output_file.write(v[3].rjust(9) + ' ')
    output_file.write(v[4].rjust(9) + ' ')
    output_file.write(v[5].rjust(9) + ' ')
    output_file.write(v[6].rjust(9) + ' ')
    output_file.write('\n')

output_file.write('\n')
output_file.write('\n')
output_file.write('\n')

times_loads_file.close()
times_queries_file.close()
output_file.close()





