#
# lister.py
#

import csv

data = []

#
# ACM Digital Library.
#

fnames = [
    'acm-dl-1', 
    'acm-dl-2', 
    'acm-dl-3', 
    'acm-dl-4'
    ]

for fname in fnames:

    file = open((fname + '.bib'), 'r')
    lines = file.readlines()
    file.close()

    for line in lines:

        if line[:9] == 'title = {':

            title = line.replace('title = {', '').replace('},', '')[:-1]

            data.append(title)

#
# Others.
#

prefixes = [
    'ieee-xplore-',
    'scopus-',
    'springer-'
    ]

for prefix in prefixes:

    for i in range(1, 5):

        with open(prefix + str(i) + '.csv') as csv_file:

            reader = csv.reader(csv_file, delimiter=',')

            next(reader)

            for row in reader:

                if prefix == 'ieee-xplore-':

                    data.append(row[0])

                if prefix == 'scopus-':

                    data.append(row[2])

                if prefix == 'springer-':

                    data.append(row[0])


#
# Write to file.
#

file = open('titles.txt', 'w')

for title in list(set(data)):

    file.write(title + '\n')

file.close()




