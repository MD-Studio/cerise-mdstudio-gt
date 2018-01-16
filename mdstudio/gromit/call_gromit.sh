#!/bin/bash

CERISE_API_FILES="$1"
LIGAND_PDB="$2"
LIGAND_TOP="$3"

# Remove the CERISE_API_FILES, lIGAND_PDB and LIGAND_TOP
# items from the input array
shift 3

# Function to evalute if a string is true or false
module load fftw3/openmpi/gcc/64/3.3.4
module load cuda75/blas/7.5.18
module load cuda75/fft/7.5.18
module load cuda75/gdk/352.79
module load cuda75/toolkit/7.5.18
module load openmpi/gcc/64/1.10.1

source $CERISE_API_FILES/miniconda/bin/activate root

GMXRC_FILE="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromacs/gromacs-2016.3/bin/GMXRC.bash"
. $GMXRC_FILE
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromit/gromit_mpi.sh"

# perform a normal MD protein-ligand simulation
$GROMIT -gmxrc $GMXRC_FILE -np 8 -vsite -lie -l $LIGAND_PDB,$LIGAND_TOP $*
