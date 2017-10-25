#!/bin/bash

CERISE_API_FILES="$1"
PROTEIN_PDB="$2"
PROTEIN_TOP="$3"
PROTEIN_ITP="$4"
LIGAND_PDB="$5"
LIGAND_TOP="$6"
LIGAND_ITP="$7"
FORCE_FIELD="$8"
SIM_TIME="$9"

module load openmpi/gcc/64/1.10.1
module load gromacs/2016.3

GMXRC_FILE="/cm/shared/apps/gromacs-2016.3/bin/GMXRC"
GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt/mdstudio/gromit/gromit_mpi.sh"

. $GMXRC_FILE
$GROMIT -gmxrc $GMXRC_FILE -vsite -np 8 -f $PROTEIN_PDB -top $PROTEIN_TOP -l $LIGAND_PDB,$LIGAND_TOP -ff $FORCE_FIELD -time $SIM_TIME

