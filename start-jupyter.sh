#!/bin/bash

(
    source coffea-spark-slurm/bin/activate
    jupyter notebook "$@"
)
