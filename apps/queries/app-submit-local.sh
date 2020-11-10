#!/bin/bash

SPARK_HOME=/Users/mateusnbm/Desktop/new-hbase-setup/spark-2.4.4-bin-without-hadoop

MODEL=M4CG1
DIR=/Users/mateusnbm/Desktop/workspace/colunar/apps/queries
JARFILE=$DIR/target/scala-2.11/HelloWorld-assembly-1.0.jar

$SPARK_HOME/bin/spark-submit \
    --class $MODEL \
    --deploy-mode client \
    --master spark://Mateuss-MacBook-Pro.local:7077 \
    --executor-memory 10g \
    --driver-memory 10g \
    $JARFILE &> results.txt
