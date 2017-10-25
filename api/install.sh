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

