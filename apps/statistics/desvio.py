#
# t-test.py
#

import csv
import statistics
import seaborn as sns
import matplotlib.pyplot as plt

from scipy import stats

scale = 'SF-10'

models_list_filename = 'data/' + scale + '/list.txt'
models_list_file = open(models_list_filename, 'r')

models = [line.strip() for line in models_list_file.readlines()]

data = {}
matrix = [[0 for _ in range(0, len(models))] for _ in range(0, len(models))]

for model in models:

    averages = []

    path  = 'data/' + scale + '/'
    path += model[0:7] + '/'
    path += model + '.csv'

    csv_file = open(path, 'r')
    csv_reader = csv.reader(csv_file, delimiter=',')

    for row in csv_reader:

        sum = 0

        for i in range(1, 8):

            sum += ( int(row[i]) / 1000)

        averages.append( sum )

    print(model)
    print(statistics.stdev(averages))
    print('')
