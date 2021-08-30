#
#!/bin/bash
#
# sh app-submit-cluster.sh CG1-GG1-FDN-F1-SH /home/mateus/results/raw/
#

MODEL=$1
OPATH=$2

SPARK_HOME=/home/mateus/spark
DIR=/home/mateus/apps/queries
JARFILE=$DIR/target/scala-2.11/HelloWorld-assembly-1.0.jar

MODEL_P1=$( echo $MODEL | cut -c1-3   )
MODEL_P2=$( echo $MODEL | cut -c5-7   )
MODEL_P3=$( echo $MODEL | cut -c9-11  )
MODEL_P4=$( echo $MODEL | cut -c13-14 )
MODEL_P5=$( echo $MODEL | cut -c16-17 )

CLASS_NAME="${MODEL_P1}_${MODEL_P2}_${MODEL_P3}_${MODEL_P4}"

$SPARK_HOME/bin/spark-submit \
    --class $CLASS_NAME \
    --master spark://master:7077 \
    --executor-cores 8 \
    --executor-memory 40g \
    --driver-memory 10g \
    $JARFILE &> $OPATH/$MODEL/times-queries.txt
