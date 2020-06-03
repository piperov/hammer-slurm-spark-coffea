#!/usr/bin/env python

# Start up Spark (only needs to be done once)
import pyspark.sql
import os
import os.path
import sys
os.environ['PYSPARK_PYTHON'] = sys.executable
session = pyspark.sql.SparkSession.builder \
    .config('spark.jars', os.path.join(os.getcwd(), 'hadoop-xrootd-1.0.4-jar-with-dependencies.jar')) \
    .config('spark.driver.extraClassPath', os.path.join(os.getcwd(), 'hadoop-xrootd-1.0.4-jar-with-dependencies.jar')) \
    .config('spark.executor.extraClassPath', os.path.join(os.getcwd(), 'hadoop-xrootd-1.0.4-jar-with-dependencies.jar')) \
    .config('spark.jars.packages', 'edu.vanderbilt.accre:laurelin:1.0.2') \
    .getOrCreate()
sc = session.sparkContext
sc.setLogLevel("INFO")
sqlContext = session

df = session.read.format('root') \
                 .option("tree", "Events") \
                 .load(['root://eospublic.cern.ch//eos/root-eos/cms_opendata_2012_nanoaod/Run2012B_DoubleMuParked.root'])

print(df.count())
for item in sorted(sc.getConf().getAll()): print(item)
