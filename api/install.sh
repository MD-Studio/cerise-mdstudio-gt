#!/bin/bash

CERISE_API_FILES="$1"
CERISE_DATA=cerise-mdstudio-share-data

# Clone or pull the share data
if [ -d "$CERISE_API_FILES/mdstudio/github/$CERISE_SPECIALIZATION" ] ; then
    cd "$CERISE_API_FILES/mdstudio/github/$CERISE_SPECIALIZATION"
    git pull
else
    mkdir -p "$CERISE_API_FILES/mdstudio/github"
    cd "$CERISE_API_FILES/mdstudio/github"
    git clone https://github.com/MD-Studio/$CERISE_SPECIALIZATION.git
fi

if [ ! -f "$CERISE_API_FILES/mdstudio/energies/getEnergies.py" ] ; then
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/MDStudio/master/components/lie_md/lie_md/scripts/getEnergies.py"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
fi

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
    echo '# Added by cerise-mdstud, sorry!' >>~/.bashrc
    echo 'if [ "a$MODULESHOME" == "a" ] ; then' >>~/.bashrc
    echo '    . /etc/profile.d/modules.sh' >>~/.bashrc
    echo 'fi' >>~/.bashrc
    echo 'module load slurm' >>~/.bashrc
fi

# Define PATH to gromacs in DAS
GMXRC_MDSTUDIO="/cm/shared/apps/gromacs-2016.3/bin/GMXRC.bash"

# ADD ENV variable if it is not already there
pred=$(grep -m 1 'GMXRC_MDSTUDIO' ~/.bashrc)
if [[ -z $pred ]]; then
    echo >>~/.bashrc
    echo "export GMXRC_MDSTUDIO=$GMXRC_MDSTUDIO" >>~/.bashrc
    echo "# End cerise-mdstudio additions" >>~/.bashrc    
fi
