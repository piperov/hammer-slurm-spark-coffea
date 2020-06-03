#!/bin/bash

SPARK_VERSION=2.4.5
SPARK_VERSION_FULL=spark-${SPARK_VERSION}-bin-hadoop2.7

if [ ! -d $SPARK_VERSION_FULL ]; then
    curl https://downloads.apache.org/spark/spark-${SPARK_VERSION}/${SPARK_VERSION_FULL}.tgz | tar xz
    ln -s $(pwd)/$SPARK_VERSION_FULL spark
fi
