#!/bin/bash
#PJM --rsc-list "node=1"
#PJM --rsc-list "rscgrp=supercon2021"
#PJM --rsc-list "elapse=0:06:00"
#PJM --mpi "proc=8"
#PJM -j

export OMP_NUM_THREADS=6
echo $OMP_NUM_THREADS

# do not generate empty output files
export PLE_MPI_STD_EMPTYFILE=off

date

# compile: choose mpiFCC (for C++) or mpifcc (for C) and edit the source file name
#  C++
mpiFCC -Ofast -fopenmp -Nclang -SSL2BLAMP solve.cpp
#  C
#mpifcc -Ofast -fopenmp -Nclang -SSL2BLAMP prog.c


# execute the program
mpiexec --stdin /vol0003/ra020003/data/prob/input1 --stdout output1.${PJM_JOBID} ./a.out


