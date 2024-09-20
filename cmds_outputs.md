# SLURM Commands with Expected Outputs and Explanations

## Outline
1. [`sinfo`](#sinfo-view-the-status-of-paritions)
2. [`squeue`](#squeue-view-the-status-of-jobs-in-the-queue)
3. [`sbatch`](#sbatch-sbumit-a-batch-job)

## `sinfo`: View the status of partitions

```bash
sinfo is aliased to `sinfo -o "%20P %10c %10m %20G %l %.6D %6t"`
```
### Format Specifier
| Format Specifier | Description                                                      |
|------------------|------------------------------------------------------------------|
| `%20P`           | Displays the **partition name**, right-aligned in a 20-character-wide column. |
| `%10c`           | Displays the **number of CPUs** available in the partition, right-aligned in a 10-character-wide column. |
| `%10m`           | Displays the **amount of memory** (in megabytes) available per node in the partition, right-aligned in a 10-character-wide column. |
| `%20G`           | Displays the **generic resources (GRES)**, such as GPUs, right-aligned in a 20-character-wide column. If no GRES is assigned, it will display `(null)`. |
| `%l`             | Displays the **time limit** for jobs in that partition. This could be a specific time or "infinite" for no limit. |
| `%.6D`           | Displays the **number of nodes** in the partition, right-aligned in a 6-character-wide column. |
| `%6t`            | Displays the **state of the nodes** in the partition, right-aligned in a 6-character-wide column. This could show values like "idle," "mix," "alloc", or "drain" |


### Example Output
```text
PARTITION            CPUS      MEMORY               GRES  TIMELIMIT  NODES  STATE
basic*                 52      384000            (null)    infinite      7    mix
basic*                 52      384000            (null)    infinite      1   idle
medium                 52      768000            (null)    infinite      5    mix
large                  52     1536000            (null)    infinite      2    mix
ML                     52      384000  gpu:tesla_a100:2    infinite      1    mix
sci                    52      384000  gpu:tesla_a40:8     infinite      2   idle
```

### Explanation:
- **PARTITION**: Displays the name of each partition.
- **CPUS**: Shows the number of CPUs available in that partition.
- **MEMORY**: Shows the total memory (in MB) available per node in that partition.
- **GRES**: Lists any specialized resources like GPUs available in the partition.
- **TIMELIMIT**: Shows the time limit for running jobs in the partition.
- **NODES**: Shows how many nodes are part of the partition.
- **STATE**: Displays the current state of the nodes.

    - **mix**: Node is partially allocated, with some resources available for jobs.
    - **idle**: Node is completely free and available for job scheduling.
    - **alloc**: Node is fully allocated with no available resources for additional jobs.
    - **drain**: Node is being taken offline for maintenance and will not accept new jobs.




## `squeue`: View the status of jobs in the queue.
### Example Output:
```plaintext
  JOBID PARTITION     NAME     USER  ST  TIME    NODES NODELIST(REASON)
 133933 ML           WEyeDS_H  te4dq  R  11:51:10  1    spdr16
 131831 basic        lyc_phy   jtonini  R  9-10:38:38 1  spdr01
 132095 basic        Methyl-2  dh2jv   R  8-03:17:15 1  spdr01
 132105 basic        Methyl-4  dh2jv   R  8-02:31:54 1  spdr01
 133690 basic        SrF_I_ri  sr3kr   R  1-06:48:41 1  spdr03
 133691 basic        SrCl_I_r  sr3kr   R  1-06:48:41 1  spdr03
 133693 basic        SrI_I_ri  sr3kr   R  1-06:48:11 1  spdr04
 133694 basic        SrAt_I_r  sr3kr   R  1-06:48:11 1  spdr04
 133695 basic        BaF_I_ri  sr3kr   R  1-06:45:11 1  spdr04
 133929 basic        BaCl_I_r  sr3kr   R  23:39:11 1  spdr04
 133930 basic        BaBr_I_r  sr3kr   R  23:39:11 1  spdr05
 133931 basic        BaI_I_ri  sr3kr   R  23:39:11 1  spdr05
 133946 basic        SrBr_I_r  sr3kr   R  4:34:10  1    spdr05
 133947 basic        BaAt_Br_  sr3kr   R  4:29:39  1    spdr05
```
#### Explanation of Output Fields:

- **JOBID**: Unique identifier for each job in the SLURM queue.
- **PARTITION**: The name of the partition where the job is being run.
- **NAME**: The name of the job. This can be a custom name provided by the user when submitting the job.
- **USER**: The user who submitted the job (UR netid).
- **ST**: The state of the job. Common states include:
  - **R**: Running (job is actively being executed).
  - **PD**: Pending (job is waiting for resources).
- **TIME**: The amount of time the job has been running or has been in the queue. Format: `days-hours:minutes:seconds`.
- **NODES**: The number of nodes allocated to this job.
- **NODELIST(REASON)**: The specific nodes that the job is running on, or the reason the job is in a certain state (e.g., pending because of lack of resources).


## `sbatch`: Submit a batch job
```bash
$ sbatch job_script.slurm
Submitted batch job 133934
```
- This command submits a batch job using the SLURM script file `job_script.slurm`, and the job is assigned the ID `133934`
- Note: please remember the job ID for furture use like canceling and controling the job
