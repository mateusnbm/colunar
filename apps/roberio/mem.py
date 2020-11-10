#!/usr/bin/env python

import os, psutil, time
from datetime import datetime
from openpyxl import load_workbook
import sys

def datetimestr():

    now = datetime.now() 

    return "{:4d}{:02d}{:02d}-{:02d}{:02d}{:02d}".format(now.year,now.month,now.day,now.hour,now.minute,now.second)


def calcMem(file):

    mem = psutil.virtual_memory()
    data = datetime.now()
    hora = str(data.hour)+":"+str(data.minute)+":"+str(data.second)
    dia  = str(data.day)+"-"+str(data.month)
    file_memory = open(file,'a')
    percent = (str(mem.percent)).replace(".",",")
    total = ("%.2f" %(float(mem.total)/ (1024.0 ** 2))).replace(".",",")
    used  = ("%.2f" %(float(mem.total - mem.free) / (1024.0 ** 2))).replace(".",",")
    file_memory.write(dia+";"+hora+";"+total+";"+used+";"+percent+"%\n")
    file_memory.close()
    del dia, hora, total, used, percent, mem


	
def main(args):
    
    dbname    = args[1]
	
    path = "/home/mateus/results/roberio/"
    file = path + dbname + "-" + datetimestr() + ".csv"
	
    print("\nMemory\nFile: " + file + "\n\nStarting...")

    # limpa o cache da memoria
    os.system("sudo sysctl -w vm.drop_caches=3")
	
    file_memory = open(file,'a')
    file_memory.write('day;hour;ram_total_mb;ram_used_mb;perc;\n')
    file_memory.close()
	
    while True:

        time.sleep(2)

        calcMem(file)
    
    return 0
 
if __name__ == '__main__':

    if (len(sys.argv) != 2):

        print("Use: sudo memory.py <prefix name>")

    else:

        main(sys.argv)

    sys.exit()
