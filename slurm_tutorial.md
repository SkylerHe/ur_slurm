# SLURM Job Script Template Overview

## 1. **Script Header**
- **`#!/bin/bash -e`**: 
    - This is known as the shebang line. It indicates that the script should be run using the Bash shell. 
    - The `-e` flag tells Bash to exit the script immediately if any command within the script fails (returns a non-zero exit status). This is useful for ensuring that errors do not go unnoticed and that the script doesn’t proceed with incomplete or incorrect operations. For instance, if a file is missing or a command fails, the script will stop rather than continuing and potentially causing further issues.

## 2. **SBATCH Directives**
   These are special comments that start with `#SBATCH`, which SLURM interprets as job scheduling instructions. They specify the resources and configurations needed for your job. `#SBATCH` directives can be in any order. Here’s a breakdown of each directive:

- **`#SBATCH --job-name=CPUEXAMPLE`**:
    - **Purpose**: This sets the name of your job, which will appear in SLURM’s job queue and in any job-related notifications. This name is helpful for identifying and tracking your job, especially when managing multiple jobs or when receiving email notifications.
    - **Usage**: Choose a short and descriptive name that reflects the purpose of your job. A concise name makes it easier to identify your job in the queue and in notifications.


- **`#SBATCH --ntasks=1`**:
    - **Purpose**: Specifies the number of tasks (individual processes) to run. Each task usually represents a single instance of a program.
    - **Usage**: For single-process applications, set this to `1`. For parallel applications that can run multiple tasks simultaneously, increase this number accordingly.


- **`#SBATCH --time=00:00:10`**:
    - **Purpose**: This sets the maximum wall time (HH:MM:SS) your job is allowed to run. After this time limit, SLURM will terminate your job if it’s still running. 
    - **Usage**: Estimate how long your job will take to run and set this value accordingly. It’s better to slightly overestimate to ensure your job isn’t terminated prematurely. However, setting a reasonable limit helps SLURM manage resources efficiently and prevents jobs from running indefinitely if something goes wrong.


- **`#SBATCH --mail-type=ALL`**:
    - **Purpose**: This directive controls when SLURM sends email notifications about your job. 
    - **Options**:
        - `ALL`: Receive notifications at all stages (job begins, ends, fails, etc.).
        - `BEGIN`: Get an email when the job starts.
        - `END`: Get an email when the job successfully completes.
        - `FAIL`: Get an email if the job fails.
        - `NONE`: No email notifications.
    - **Usage**: Adjust this based on your needs. For example, if you only care about knowing whether the job completed or failed, you might use `--mail-type=END,FAIL`.


- **`#SBATCH --mail-user=netid@richmond.edu`**:
    - **Purpose**: This is the email address where SLURM will send notifications based on the `--mail-type` setting.
    - **Usage**: Replace `netid@richmond.edu` with your own email address. Make sure it’s an email you check regularly, especially if you’re monitoring the job status closely.


- **`#SBATCH --partition=basic`**:
  - **Purpose**: SLURM clusters are divided into partitions (also known as queues), each with different resource limits and policies, such as maximum runtime or available nodes.
  - **Usage**: Specify the partition that best suits your job’s requirements. The main partitions include:
    - `basic`: For small, general-purpose jobs; default partition with 384GB of memory and no GPU.
    - `medium`: For moderately sized jobs; compute nodes with 768GB of memory.
    - `large`: For jobs requiring significant computational resources; nodes with 1536GB (1.5TB) of memory.
    - `ML`: Optimized for machine learning tasks; includes one node with two A100 GPUs.
    - `sci`: Designed for scientific computing; two nodes with eight A40 GPUs each.
    - `condo`: Typically reserved for specific research groups or dedicated resources.

    If you’re unsure which partition to use, consult your professor or [get help](README.md#getting-help).


- **`#SBATCH --mem=24000`**:
    - **Purpose**: This specifies the amount of memory (in MB) allocated to your job. SLURM will ensure that this amount of memory is available to your job during execution.
    - **Usage**: Estimate the memory needs of your job. For instance, if your program processes large datasets, you may need more memory. Specifying too little memory can cause your job to be killed if it exceeds the allocation, while specifying too much can waste resources. In this example, 24,000 MB (or 24 GB) of memory is allocated.


- **`#SBATCH --cpus-per-task=4`**:
   - **Purpose**: This sets the number of CPU cores to allocate per task. It is particularly important for multi-threaded applications, where a single task can utilize multiple cores to perform parallel processing.
   - **Usage**: 
     - For CPU-only tasks: Set this value to match the number of cores your application can efficiently use. In most cases, 4 CPUs is the correct allocation
     - For GPU workloads: Typically, you should request no more than **4 CPU** cores per task, as the majority of the workload will be handled by the GPU, and additional CPU cores are unlikely to improve performance.
     - For single-threaded applications: This would typically be set to 1.

- **`#SBATCH --gres=gpu:tesla_a40:1`**
    - **GPU Resource Request**: Requests 1 Tesla A40 GPU for the job. The `--gres` (Generic Resources) option is used to allocate specific hardware resources, in this case, a GPU. The format is `gpu:<type>:<count>`, where `tesla_a40` specifies the GPU model and `1` indicates the number of GPUs required.
    - **Usage**:
        ```bash
        # ML: One node with two A100 GPUs. 
        #SBATCH --partition=ml
        #SBATCH --gres=gpu:a100:1  # Request 1 A100 GPU

        # Sci: The two nodes with eight A40 GPUs each.
        #SBATCH --partition=sci
        #SBATCH --gres=gpu:tesla_a40:2  # Request 2 A40 GPUs
        ```
    - **Note**: This directive is specific to GPU jobs and is **not needed** in a CPU-only SLURM script. If you are running a job that does not require a GPU, you can omit this line.

- **`#SBATCH --account=cparish`**:
  - **Purpose**: Specifies the account under which the job is charged. This is used for reporting and statistics, especially when users are associated with multiple faculty sponsors.
  - **Usage**: Replace `cparish` with your own NetID (e.g., `--account=your_netid`) to ensure the job is correctly attributed to your account or the faculty sponsor you're working under.


- **`#SBATCH --output=%x.%j.out`**:
  - **Purpose**: Specifies the file where standard output (`stdout`) from the job is saved.
  - **Placeholders**:
    - **`%x`**: This placeholder is replaced by the job name specified in the `#SBATCH --job-name` directive. If no job name is specified, it defaults to the script name.
    - **`%j`**: This placeholder is replaced by the job ID, a unique identifier assigned by SLURM when the job is submitted.
  - **Default**: If not specified, SLURM saves output to `slurm-JOBID.out`.
  - **Usage**: The content of the output file is determined by the commands executed in the script after the `#SBATCH` directives. [Job Execution Commands](#job-execution-commands)
  


- **`#SBATCH --error=%x.%j.err`**:
  - **Purpose**: Specifies the file where standard error (`stderr`) from the job is saved.
  - **Placeholders**:
    - **`%x`**: This placeholder is replaced by the job name specified in the `#SBATCH --job-name` directive. If no job name is specified, it defaults to the script name.
    - **`%j`**: This placeholder is replaced by the job ID, a unique identifier assigned by SLURM when the job is submitted.
  - **Default**: If not specified, SLURM saves error messages to `slurm-JOBID.err`.

## Job Execution Commands

After the `#SBATCH` directives, the script proceeds to execute a series of commands. These commands are run in the order they appear.

```bash
# Print the simulation start date/time
date
```
- **Purpose**: Prints the current date and time, marking the start of the job. This is useful for logging the job’s execution timeline.

```bash
# Print the node the simulation is running on
echo "I ran on:"
echo "SLURM_NODELIST=$SLURM_NODELIST"
```
- **Purpose**: Prints the name(s) of the compute node(s) allocated for the job. `SLURM_NODELIST` is an environment variable set by SLURM that contains this information. This helps in identifying where the job ran, which is particularly important in multi-node environments.


```bash
# Return the context/PWD to the directory where *this* file is located.
cd $SLURM_SUBMIT_DIR
```
- **Purpose**: Ensures that the script continues execution from the directory where it was submitted. 
    - `$SLURM_SUBMIT_DIR` is an environment variable automatically set by SLURM, which contains the path to the directory from which the job was submitted. This is important if your job relies on files or scripts in that directory.

```bash
# Load the necessary program libraries
# module load some_module_name
```
- **Purpose**: Placeholder for loading any required software modules or libraries. Uncomment and modify this line if your job requires specific modules to be loaded.


### Actual Program Execution

- **Purpose**: This section of the script is where the actual execution of your program or job takes place. 

```bash
# Run jobs
output_dir=/scratch/dir_name/
mkdir -p $output_dir
/usr/bin/time -v python my_program.py > $output_dir/output.csv
```
**Detailed Explanation**:

```bash
output_dir=/scratch/dir_name/
```
- **Defines Output Directory**: Sets `output_dir` as the path where the output files will be stored. The directory is located in the `/scratch/`, which has the largest available memory, making it suitable for handling large outputs or temporary data

```bash
mkdir -p $output_dir
```
- **Creates Directory**: Ensures that the directory specified by `output_dir` exists. The `-p` option makes the command create any necessary parent directories as well, without throwing an error if the directory already exists.

```bash
/usr/bin/time -v python my_program.py > $output_dir/output.csv
```
- **Executes Program**: 
   - Runs the Python script `my_program.py`.   
   - Uses `/usr/bin/time -v` to track and report detailed resource usage (like memory and CPU time).
   - Redirects the script’s output to `output.csv` in the specified `output_dir`.


```bash

# Print the simulation end date/time
date
```
- **Purpose**: Prints the current date and time again, marking the end of the job. This allows you to determine the total runtime of the job.







## Additional Considerations:
- **Resource Allocation**: It's important to balance your resource requests with the actual needs of your job. Requesting too many resources can lead to longer wait times in the job queue, as SLURM needs to find nodes with the available resources, while requesting too few can result in job failures.
  
- **Job Prioritization**: Be mindful of how your job might affect others in the cluster. Using resources efficiently not only helps your jobs run smoothly but also ensures that other users can access the resources they need.
