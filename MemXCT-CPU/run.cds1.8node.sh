#!/bin/bash
#SBATCH --job-name=cds1_single_cpu
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=60
#SBATCH --output=cds1_eight_node.o%j.%N

#DOMAIN INFORMATION
export NUMTHE=750
export NUMRHO=512
export PIXSIZE=1
#SOLVER DATA
export NUMITER=30
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=32
export SPECSIZE=32
#BLOCK SIZE
export PROJBLOCK=128
export BACKBLOCK=128
#BUFFER SIZE
export PROJBUFF=8
export BACKBUFF=8
#I/O FILES
export THEFILE=./MemXCT_datasets/CDS1_theta.bin
export SINFILE=./MemXCT_datasets/CDS1_sinogram.bin
export OUTFILE=./recon_CDS1.bin

export OMP_NUM_THREADS=60
export BLIS_IC_NT=$OMP_NUM_THREADS

MPI_OPTS="-np 16"
MPI_OPTS+=" --map-by socket:PE=60"
mpirun $MPI_OPTS ./memxct
