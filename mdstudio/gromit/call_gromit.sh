#!/bin/bash

CERISE_API_FILES="$1"
PROTEIN_PDB="$2"
PROTEIN_TOP="$3"
LIGAND_PDB="$4"
LIGAND_TOP="$5"
FORCE_FIELD="$6"
SIM_TIME="$7"

module load openmpi/gcc/64/1.10.1
module load gromacs/2016.3

source $CERISE_API_FILES/miniconda/bin/activate root

GMXRC_FILE="/cm/shared/apps/gromacs-2016.3/bin/GMXRC"
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt/mdstudio/gromit/gromit_mpi.sh"

export CUDA_VISIBLE_DEVICES=0,1,2,3

. $GMXRC_FILE
$GROMIT -gmxrc $GMXRC_FILE -vsite -np 4 -f $PROTEIN_PDB -top $PROTEIN_TOP -l $LIGAND_PDB,$LIGAND_TOP -ff $FORCE_FIELD -time $SIM_TIME -lie

