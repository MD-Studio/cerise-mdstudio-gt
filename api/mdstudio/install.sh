# Run base install
$CERISE_PROJECT_FILES/install_base.sh

# GT doesn't have SLURM available by default!
# Since Cerise doesn't have support for 'module load slurm' yet,
# we add it to the user's .bashrc here. Not ideal, but it's not
# unprecedented either for installers to modify your .bashrc.
# And it will be fixed for Cerise 1.0.
if ! grep -q 'cerise-mdstudio' ~/.bashrc ; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio, sorry!' >>~/.bashrc
    echo 'if [ "a$MODULESHOME" == "a" ] ; then' >>~/.bashrc
    echo '    . /etc/profile.d/modules.sh' >>~/.bashrc
    echo 'fi' >>~/.bashrc
    echo 'module load slurm' >>~/.bashrc
    echo "# End cerise-mdstudio additions" >>~/.bashrc  
fi
