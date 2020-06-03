#!/bin/bash

#
# Configuration
#
WORKER_CORES="8"
SLURM_CORES=$WORKER_CORES
WORKER_MEM=4G
SLURM_MEM=20G

# Dont let the worker daemonize
export SPARK_NO_DAEMONIZE=1


if [[ "$(hostname -a)" == *vampire ]]; then
    # VU-specific hack
    SLURM_CORES=$(( $WORKER_CORES / 2 ))
fi

# sbatch --reservation=melo_py36 --mem=$SLURM_MEM --cpus-per-task=$SLURM_CORES \
sbatch --reservation=spiperov-Spark --partition=hammer-c --mem=$SLURM_MEM --cpus-per-task=$SLURM_CORES \
    ./start-worker.sh spark://$(hostname):7077 -m $WORKER_MEM -c $WORKER_CORES


