# UR SLURM Tutorial

Welcome to the University of Richmond's SLURM Tutorial! This guide is designed to help you get started with using the SLURM workload manager on the University of Richmond's computing cluster.

## Overview

[SLURM](https://slurm.schedmd.com/) is a powerful and flexible job scheduling system used for managing and scheduling workloads on large-scale compute clusters. This tutorial will cover the basics of submitting jobs, monitoring their progress, and managing resources effectively.

## Contents

1. **Introduction to SLURM**: 
   - Overview of SLURM and its role in managing computing resources.
   - Key concepts: jobs, nodes, partitions, and queues.

2. **Getting Started**:
   - Logging into the UR computing cluster.
      - Off-campus please connect [VPN](https://spidertechnet.richmond.edu/TDClient/1955/Portal/KB/ArticleDet?ID=125025)
   - Basic SLURM commands (e.g., `srun`, `sbatch`, `squeue`, `scancel`).

3. **Submitting Jobs**:
   - How to write a SLURM job script.
   - Submitting a job using `sbatch`.
   - Example job scripts for different types of tasks (e.g., serial, parallel, GPU jobs).

4. **Monitoring Jobs**:
   - Checking job status with `squeue`.
   - Viewing job details with `scontrol`.
   - Accessing job history with `sacct`.

5. **Managing Resources**:
   - Specifying resources (e.g., CPUs, memory) in job scripts.
   - Understanding SLURM partitions and how to select them.

6. **Advanced SLURM Usage**:
   - Job dependencies.
   - Array jobs.
   - Interactive jobs with `srun`.

## Prerequisites

- Basic familiarity with the Linux command line.
- An account on the University of Richmond's computing cluster.

## Getting Help

If you run into any issues or have questions, please reach out to the IT helpdesk or consult the official SLURM documentation.

## Contributing

If you have suggestions or would like to contribute to this tutorial, please contact the tutorial maintainers.

## License

This tutorial is licensed under the MIT License.
