# UR SLURM Tutorial

Welcome to the University of Richmond's SLURM Tutorial! This guide is designed to help you get started with using the SLURM workload manager on the University of Richmond's computing cluster.

## Overview

[SLURM](https://slurm.schedmd.com/) is a powerful and flexible job scheduling system used for managing and scheduling workloads on large-scale compute clusters. This tutorial will cover the basics of submitting jobs, monitoring their progress, and managing resources effectively.

## Contents

- **`slurm_tutorial.md`**: 
  - This tutorial provides detailed explanations on how to write and structure SLURM job scripts. It covers various SBATCH directives, job execution commands, and best practices for resource allocation.
  - The tutorial references the example SLURM files included in this repository, explaining each part of the scripts in detail to help you tailor them to your specific needs.

- **`cpu.example.slurm`**:
  - A clean, final version of a SLURM script designed for CPU-based tasks. This file can be used as a template for jobs that do not require GPU resources.

- **`gpu.example.slurm`**:
  - A clean, final version of a SLURM script designed for GPU-based tasks. This script includes the necessary directives to request GPU resources and is ideal for jobs that involve machine learning, deep learning, or other GPU-accelerated computations.

## How to Use

1. **Start with the Examples**:
   - Use `cpu.example.slurm` or `gpu.example.slurm` as a base template depending on whether your job requires CPU or GPU resources.
   - These example files are ready to be customized with your specific job details.

2. **Refer to the Tutorial**:
   - Consult [`slurm_tutorial.md`](slurm_tutorial.md) for a detailed breakdown of each section within the example SLURM files. The tutorial explains the purpose and function of each SBATCH directive and command, helping you understand how to optimize your SLURM scripts.

3. **Customize Your SLURM Script**:
   - Modify the example SLURM scripts with your job-specific parameters, such as job name, time limits, partition selection, and resource requests. Use the tutorial to ensure you are making informed decisions about each aspect of your script.


## Getting Started
- **Login**: Access the [UR computing cluster](https://data.richmond.edu/About-HPC-at-UR/index.html) by running:
  ```bash
  ssh netid@spydur
  ```
  Use your **Richmond password** when prompted.
    - Off-campus: Connect via [VPN](https://spidertechnet.richmond.edu/TDClient/1955/Portal/KB/ArticleDet?ID=125025)

## Basic SLURM commands

### Job Submission
- **`sbatch`**: Submit a batch job (non-interactive).
    ```bash
    sbatch job_script.slurm
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

## FAQ
1. **Should you launch the SLURM job from Spydur (the head node) specifying partition in the script?**
   - **Yes**, the correct method is to submit your job through SLURM from the head node (`spydur`), specifying the partition name in your SLURM script (e.g., using the `--partition=basic` option in your SLURM script). This ensures your job is queued properly and given access to resources in a controlled manner 
## Getting Help
+ George Flanagin: [gflanagi@richmond.edu](mailto:gflanagi@richmond.edu)
+ João Tonini: [jtonini@richmond.edu](mailto:jtonini@richmond.edu)
+ Skyler He: [skyler.he@richmond.edu](mailto:skyler.he@richmond.edu)
