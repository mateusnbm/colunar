#!/bin/bash


SPARK_HOME=/Users/mateusnbm/Desktop/new-hbase-setup/spark-2.4.4-bin-without-hadoop

MODEL=M1CG3
DIR=/Users/mateusnbm/Desktop/workspace/colunar/apps/queries
JARFILE=$DIR/target/scala-2.11/HelloWorld-assembly-1.0.jar

$SPARK_HOME/bin/spark-submit --class $MODEL --master local $JARFILE
