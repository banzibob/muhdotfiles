#!/usr/bin/env bash

# do some symlinking of dotfiles 
ln -sf ~/muhdotfiles/.vimrc ~/.vimrc
ln -sf ~/muhdotfiles/.vim/ ~/.vim

ln -sf ~/muhdotfiles/.bashrc ~/.bashrc
ln -sf ~/muhdotfiles/.bash_profile ~/.bash_profile

ln -sf ~/muhdotfiles/.gitconfig ~/.gitconfig


#need to distinguish between mac and linux
# install installers
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew tap caskroom/cask
#brew install brew-cask
#brew tap caskroom/versions

#brew update
#brew upgrade

# install all the things
#TODO: Make these an array and iterate over it
#brew install git
#brew install wget
#brew install curl

#brew cask install dropbox
#brew cask install google-chrome
#brew cask install virtualbox
#brew cask install vlc


