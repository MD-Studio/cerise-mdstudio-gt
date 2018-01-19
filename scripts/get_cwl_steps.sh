#!/bin/bash

files=("decompose.cwl" "energies.cwl" "gromit.cwl")

REPO="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/api/steps/mdstudio"

for f in ${files[*]}; do
    wget $REPO/$f  -P "api/steps/mdstudio"
done
