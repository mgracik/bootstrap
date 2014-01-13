#!/bin/bash

set -x

GITNAME="Martin Gracik"
GITEMAIL="martin@gracik.me"

# git
sudo apt-get install -y git git-email git-doc git-man
git config --global user.name $GITNAME
git config --global user.email $GITEMAIL
git config --global color.ui auto
git config --global alias.st status
git config --global alias.ci commit

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo apt-get install -y oracle-java7-set-default

# vim
git clone https://github.com/mgracik/vim-config.git
{ cd vim-config && ./vim-install.sh; }

# misc
sudo apt-get install -y mc unrar irssi

# default dirs
mkdir $HOME/bin