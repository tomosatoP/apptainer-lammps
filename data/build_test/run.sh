#!/bin/bash

INPUT_FILE=/lammps/examples/melt/in.melt

mpirun --allow-run-as-root -x OMP_NUM_THREADS=1 -np 6 lmp -sf gpu -in $INPUT_FILE
