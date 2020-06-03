#!/bin/bash
set -e

if [ ! -d coffea-spark-slurm ]; then
    (
        python3.6 -m venv coffea-spark-slurm
        source coffea-spark-slurm/bin/activate
        pip install --upgrade pip
        pip install --upgrade pyspark[sql]
        pip install --upgrade coffea jupyter-server
    )
fi
