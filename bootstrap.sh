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

# base dirs
mkdir $HOME/bin

# leiningen
(
  cd $HOME/bin &&
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein &&
  chmod a+x lein &&
  ./lein;
)

# enable cider-nrepl
cat <<EOF > $HOME/.lein/profiles.clj
{:user {:plugins [[cider/cider-nrepl "0.7.0"]]}}
EOF

# emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# setup emacs for clojure
test -f $HOME/.emacs && rm $HOME/.emacs
test -d $HOME/.emacs.d && rm -rf $HOME/.emacs.d
git clone https://github.com/flyingmachine/emacs-for-clojure.git $HOME/.emacs.d && rm -rf $HOME/.emacs.d/.git

# vim
git clone https://github.com/mgracik/vim-config.git
{ cd vim-config && ./vim-install.sh; }

# misc
sudo apt-get install -y mc unrar irssi
