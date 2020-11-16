#!/bin/bash
#SBATCH --job-name=cds2_single_cpu
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
######SBATCH --cpus-per-task=4
#SBATCH --output=cds2_gpu_2node.o%j.%N

#DOMAIN INFORMATION
export NUMTHE=375
export NUMRHO=1024
export PIXSIZE=1
#SOLVER DATA
export NUMITER=24
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=64
export SPECSIZE=64
#BLOCK SIZE
export PROJBLOCK=512
export BACKBLOCK=512
#BUFFER SIZE
export PROJBUFF=96
export BACKBUFF=96
#I/O FILES
export THEFILE=./MemXCT_datasets/CDS2_theta.bin
export SINFILE=./MemXCT_datasets/CDS2_sinogram.bin
export OUTFILE=./recon_CDS2.bin


MPI_OPTS="-np 8"

mpirun $MPI_OPTS ./memxct

