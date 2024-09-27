#!/bin/bash
DOTFILES=$(ls -al | grep '^-' | grep -v "install" | awk '{print "find `pwd` -name "$9}' | sh)
for dotfile in ${DOTFILES}; do
    DOTHOME=$HOME/$(echo $dotfile | awk -F/ '{print $NF}')
    if [ -f $DOTHOME ]; then
        rm $DOTHOME
    fi
    ln -s $dotfile $DOTHOME

	if [[ $(uname -s) == Linux ]]
	then
		source $HOME/.bashrc
	else
		source $HOME/.bash_profile
	fi
done
