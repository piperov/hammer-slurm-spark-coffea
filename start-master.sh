#!/bin/bash

SPARK_HOME="$(cd "`dirname "$0"`"/..; pwd)/spark"
exec ./spark/sbin/start-master.sh "$@"
