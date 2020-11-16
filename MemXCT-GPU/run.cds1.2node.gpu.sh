#!/bin/bash
#SBATCH --job-name=cds1_single_gpu
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
######SBATCH --cpus-per-task=4
#SBATCH --output=cds1_gpu_2node.o%j.%N

#DOMAIN INFORMATION
export NUMTHE=750
export NUMRHO=512
export PIXSIZE=1
#SOLVER DATA
export NUMITER=24
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=128
export SPECSIZE=128
#BLOCK SIZE
export PROJBLOCK=512
export BACKBLOCK=512
#BUFFER SIZE
export PROJBUFF=96
export BACKBUFF=96
#I/O FILES
export THEFILE=./MemXCT_datasets/CDS1_theta.bin
export SINFILE=./MemXCT_datasets/CDS1_sinogram.bin
export OUTFILE=./recon_CDS1.bin

export PATH=$PATH:/usr/local/cuda-11.0/bin

MPI_OPT="-np 8"
mpirun $MPI_OPTS ./memxct
