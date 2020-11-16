#!/bin/bash
#SBATCH --job-name=cds3_single_cpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=15
#SBATCH --cpus-per-task=4
#SBATCH --output=cds3_single_cpu.o%j.%N

#DOMAIN INFORMATION
export NUMTHE=1501
export NUMRHO=2048
export PIXSIZE=1
#SOLVER DATA
export NUMITER=24
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=32
export SPECSIZE=32
#BLOCK SIZE
export PROJBLOCK=128
export BACKBLOCK=128
#BUFFER SIZE
export PROJBUFF=16
export BACKBUFF=16
#I/O FILES
export THEFILE=./MemXCT_datasets/CDS3_theta.bin
export SINFILE=./MemXCT_datasets/CDS3_sinogram.bin
export OUTFILE=./recon_CDS3.bin

export OMP_NUM_THREADS=4



MPI_OPTS="-np 15"
MPI_OPTS+=" --map-by l3cache:PE=4"
mpirun $MPI_OPTS ./memxct
