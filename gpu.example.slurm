#!/bin/bash -e

#SBATCH --job-name=GPUEXAMPLE
#SBATCH --ntasks=1
#SBATCH --time=00:00:10
#SBATCH --mail-type=ALL
#SBATCH --mail-user=netid@richmond.edu

#SBATCH --partition=sci
#SBATCH --gres=gpu:tesla_a40:1
#SBATCH --cpus-per-task=4

# Print the simulation start date/time
date

# Print the node the simulation is running on
echo "I ran on:"
echo "SLURM_NODELIST=$SLURM_NODELIST"

# Return the context/PWD to the directory where *this* file is located.
cd $SLURM_SUBMIT_DIR

# Load the necessary program libraries

# Run Jobs

/usr/bin/time ......

# Print the simulation end date/time
date

