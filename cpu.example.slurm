#!/bin/bash -e

#SBATCH --job-name=CPUEXAMPLE
#SBATCH --ntasks=1
#SBATCH --time=00:00:10
#SBATCH --mail-type=ALL
#SBATCH --mail-user=netid@richmond.edu

#SBATCH --partition=basic
#SBATCH --mem=24000
#SBATCH --cpus-per-task=8

# Print the simulation start date/time
date

# Print the node the simulation is running on
echo "I ran on:"
echo "SLURM_NODELIST=$SLURM_NODELIST"

# Return the context/PWD to the directory where *this* file is located.
cd $SLURM_SUBMIT_DIR

# Load the necessary program libraries

# Run jobs

# Print the simulation end date/time
date

