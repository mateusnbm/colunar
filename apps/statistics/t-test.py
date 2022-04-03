#
# t-test.py
#

import csv
import seaborn as sns
import matplotlib.pyplot as plt

from scipy import stats

scale = 'SF-1'

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

            sum += int(row[i])

        averages.append( sum )

    data[model] = averages

for i in range(0, len(models)):

    for j in range(0, len(models)):

        a = data[models[i]]
        b = data[models[j]]

        t_value, p_value = stats.ttest_ind(a, b)

        matrix[i][j] = p_value

        print(models[i])
        print(models[j])
        print('{:.8f}'.format(p_value))
        print('p-value for two tailed test is %f'%p_value)
        print('')

labels = [ '1', '', '', '',
           '5', '', '', '', '',
          '10', '', '', '', '',
          '15', '', '', '', '',
          '20', '', '', '', '',
          '25', '', '', '', '',
          '30', '', '', '', '',
          '35', '']

ax = sns.heatmap(matrix, xticklabels=labels, yticklabels=labels);

ax.xaxis.tick_top()

plt.show()
