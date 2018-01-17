#!/bin/bash

CERISE_API_FILES="$1"
LIGAND_PDB="$2"
LIGAND_TOP="$3"

# Remove the CERISE_API_FILES, lIGAND_PDB and LIGAND_TOP
# items from the input array
shift 3

# Modules to call gromacs
module load openmpi/gcc/64/1.10.1
module load gromacs/2016.3 


# path to gromacs and gromit
GMXRC_FILE="/cm/shared/apps/gromacs-2016.3/bin/GMXRC.bash"
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt/mdstudio/gromit/gromit_mpi.sh"

export CUDA_VISIBLE_DEVICES=0,1,2,3

# perform a MD simulation
source $CERISE_API_FILES/miniconda/bin/activate root
$GROMIT -gmxrc $GMXRC_FILE -np 8 -vsite -lie -l $LIGAND_PDB,$LIGAND_TOP $*
