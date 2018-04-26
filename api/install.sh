#!/bin/bash

CERISE_API_FILES="$1"

# Install share data and miniconda
INSTALL_SCRIPT="$CERISE_API_FILES/mdstudio/bin/install_share.sh"

if [ ! -f $INSTALL_SCRIPT ] ; then
    # Download installation
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/v0.1/scripts/install_share.sh"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
    chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
fi

# GT doesn't have SLURM available by default!
# Since Xenon won't do 'module load slurm' every time it starts,
# we add it to the user's .bashrc here. Not ideal, but it's not
# unprecedented either for installers to modify your .bashrc.
if ! grep -q 'cerise-mdstudio' ~/.bashrc ; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio, sorry!' >>~/.bashrc
    echo 'if [ "a$MODULESHOME" == "a" ] ; then' >>~/.bashrc
    echo '    . /etc/profile.d/modules.sh' >>~/.bashrc
    echo 'fi' >>~/.bashrc
    echo 'module load slurm' >>~/.bashrc
    echo "# End cerise-mdstudio additions" >>~/.bashrc  
fi
