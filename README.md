# UR SLURM Tutorial

Welcome to the University of Richmond's SLURM Tutorial! This guide is designed to help you get started with using the SLURM workload manager on the University of Richmond's computing cluster.

## Overview

[SLURM](https://slurm.schedmd.com/) is a powerful and flexible job scheduling system used for managing and scheduling workloads on large-scale compute clusters. This tutorial will cover the basics of submitting jobs, monitoring their progress, and managing resources effectively.

## Getting Started
- **Login**: Access the [UR computing cluster](https://data.richmond.edu/About-HPC-at-UR/index.html) by running:
  ```bash
  ssh netid@spydur
  ```
  Use your Richmond password when prompted.
    - Off-campus: Connect via [VPN](https://spidertechnet.richmond.edu/TDClient/1955/Portal/KB/ArticleDet?ID=125025)

## Basic SLURM commands

### Job Submission
- **`sbatch`**: Submit a batch job (non-interactive).
    ```bash
    sbatch job_script.sh
    ```

### Job Monitoring

- **`squeue`**: View the status of jobs in the queue.
  ```bash
  squeue
  squeue -j <job_id>
  ```

- **`scontrol`**: Display detailed information about jobs, nodes, and partitions.
  ```bash
  scontrol show job <job_id>
  ```

- **`sacct`**: Display historical job accounting data.
  ```bash
  sacct -j <job_id>
  ```

### Job Management

- **`scancel`**: Cancel a job.
  ```bash
  scancel <job_id>
  ```

### Node and Partition Information

- **`sinfo`**: View the status of nodes and partitions.
  ```bash
  sinfo
  sinfo -N -l
  ```

### Resource Allocation

- **`salloc`**: Allocate resources for an interactive job.
  ```bash
  salloc --nodes=2 --ntasks-per-node=4
  ```

### SLURM Help

- **`man`**: Display the manual page for any SLURM command.
  ```bash
  man sbatch
  man srun
  ```

- **`--help`**: Display help information for a specific SLURM command.
  ```bash
  srun --help
  sbatch --help
  ```


## Getting Help

Skyler He: [skyler.he@richmond.edu](mailto:skyler.he@richmond.edu)
