#!/bin/bash

CERISE_API_FILES="$1"
CERISE_DATA=cerise-mdstudio-share-data

# Install share data and miniconda
SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/scripts/install_share.sh"
wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
$CERISE_API_FILES/mdstudio/bin/install_share.sh $CERISE_API_FILES
