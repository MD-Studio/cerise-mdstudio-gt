#!/bin/bash

CERISE_API_FILES="$1"

# remove the CERISE_API_FILES from the input array
shift

source $CERISE_API_FILES/miniconda/bin/activate root

# Run script
$CERISE_API_FILES/miniconda/bin/python2.7 $CERISE_API_FILES/mdstudio/bin/getEnergies.py energy -o energy.ene $*
