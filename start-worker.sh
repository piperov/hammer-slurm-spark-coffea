#!/bin/bash

(
    source coffea-spark-slurm/bin/activate
    SPARK_HOME="$(cd "`dirname "$0"`"/..; pwd)/spark"
    export ARROW_PRE_0_15_IPC_FORMAT=1
    exec ./spark/sbin/start-slave.sh "$@"
)
