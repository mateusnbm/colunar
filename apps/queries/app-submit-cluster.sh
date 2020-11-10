#
#!/bin/bash
#
# sh app-submit-cluster.sh M4CG1 /home/mateus/results/raw/
#

MODEL=$1
OPATH=$2

SPARK_HOME=/home/mateus/spark
DIR=/home/mateus/apps/queries
JARFILE=$DIR/target/scala-2.11/HelloWorld-assembly-1.0.jar

#echo ""
#echo $MODEL
#echo $OUTPUT
#echo ""

$SPARK_HOME/bin/spark-submit \
    --class $MODEL \
    --master spark://master:7077 \
    --executor-cores 8 \
    --executor-memory 40g \
    --driver-memory 10g \
    $JARFILE &> $OPATH/$MODEL/times-queries.txt
