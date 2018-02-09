#!/bin/bash

CERISE_API_FILES="$1"
CERISE_DATA=cerise-mdstudio-share-data

# Install share data and miniconda
SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/scripts/install_share.sh"
wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
$CERISE_API_FILES/mdstudio/bin/install_share.sh $CERISE_API_FILES

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
    echo "# End cerise-mdstudio additions" >>~/.bashrc  
fi
