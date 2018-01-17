#!/bin/bash

CERISE_API_FILES="$1"

# remove the CERISE_API_FILES from the input array
shift

# Activate environment
source $CERISE_API_FILES/miniconda/bin/activate root
GMXRC_FILE="/cm/shared/apps/gromacs-2016.3/bin/GMXRC.bash"

# Call script
$CERISE_API_FILES/miniconda/bin/python2.7 $CERISE_API_FILES/mdstudio/bin/getEnergies.py decompose -gmxrc $GMXRC_FILE -o decompose.ene $*
