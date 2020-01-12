
dir1=/Users/mateusnbm/Downloads/spark-2.4.4-bin-hadoop2.7/jars/
dir2=/Users/mateusnbm/spark/spark/jars/

only_in=$dir2

diff -r $dir1 $dir2 | grep $only_in | awk '{print $4}' > diff.txt
