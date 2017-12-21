#!/bin/bash

CERISE_API_FILES="$1"

if [ -d "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt" ] ; then
    cd "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt"
    git pull
else
    mkdir -p "$CERISE_API_FILES/mdstudio/github"
    cd "$CERISE_API_FILES/mdstudio/github"
    git clone https://github.com/MD-Studio/cerise-mdstudio-gt.git
    cd "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-gt"
    git checkout develop
fi

# Download getEnergies script
if [ ! -f "$CERISE_API_FILES/mdstudio/energies/getEnergies.py" ] ; then
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/MDStudio/prototype/components/lie_md/lie_md/scripts/getEnergies.py"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
fi

# install python dependencies
if [ ! -d "$CERISE_API_FILES/miniconda" ] ; then
    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $CERISE_API_FILES/miniconda
    conda config --set always_yes yes --set changeps1 no --set auto_update_conda False
    source $CERISE_API_FILES/miniconda/bin/activate root
    conda clean --index-cache
    pip install panedr
fi

# GT doesn't have SLURM available by default!
# Since Xenon won't do 'module load slurm' every time it starts,
# we add it to the user's .bashrc here. Not ideal, but it's not
# unprecedented either for installers to modify your .bashrc.
if ! grep -q 'cerise-mdstudio-gt' ~/.bashrc ; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio-gt, sorry!' >>~/.bashrc
    echo 'if [ "a$MODULESHOME" == "a" ] ; then' >>~/.bashrc
    echo '    . /etc/profile.d/modules.sh' >>~/.bashrc
    echo 'fi' >>~/.bashrc
    echo 'module load slurm' >>~/.bashrc
    echo '# End cerise-mdstudio-gt additions' >>~/.bashrc
fi

