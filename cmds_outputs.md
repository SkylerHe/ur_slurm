# Partition Information

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
| `%6t`            | Displays the **state of the nodes** in the partition, right-aligned in a 6-character-wide column. This could show values like "idle," "mix," or "allocated." |


### Example Output
```text
PARTITION            CPUS      MEMORY               GRES  TIMELIMIT  NODES  STATE
basic*                 52      384000            (null)    infinite      7    mix
basic*                 52      384000            (null)    infinite      1   idle
medium                 52      768000            (null)    infinite      5    mix
large                  52     1536000            (null)    infinite      2    mix
ML                     52      384000  gpu:tesla_a100:2    infinite      1    mix
sci                    52      384000  gpu:tesla_a40:8    infinite       2   idle
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


