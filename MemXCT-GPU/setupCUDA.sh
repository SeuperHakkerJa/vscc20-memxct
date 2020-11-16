#!/bin/bash
#SBATCH --job-name=installcuda     # Job name
#SBATCH --nodes=1                    # Run all processes on a single node
#SBATCH --partition=hpc
#SBATCH --nodelist=hpc-pg0-1
#SBATCH --ntasks-per-node=24                # Run a single task
#SBATCH --time=00:59:00              # Time limit hrs:min:sec
#SBATCH --output=installation%j.log     # Standard output and error log


module load gcc-9.2.0


wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-rhel7-11-0-local-11.0.2_450.51.05-1.x86_64.rpm
sudo rpm -i cuda-repo-rhel7-11-0-local-11.0.2_450.51.05-1.x86_64.rpm
sudo yum clean all
sudo yum -y install nvidia-driver-latest-dkms cuda
sudo yum -y install cuda-drivers

export PATH=$PATH:/usr/local/cuda-11.0/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.0/lib64

lshw
