#!/usr/bin/env bash

# install ansible based on os {{{

# if redhat family {{{
if [ -f /etc/redhat_release ]; then
	# install ansible	
	yum update -y python ruby
	yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
	yum install -y python-setuptools python-yaml python-jinja2 python-paramiko python-crypto libselinux-python ansible
	
	ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
	chmod 600 /root/.ssh
	chmod 700 /root/.ssh/authorized_keys
	
	chmod -x ~/ansible/hosts

# }}}
# if debian family {{{
elif [ -f /etc/debian_version ]; then
	# install ansible

# }}}
# if osx {{{
#elif [ something]; then 
	# install ansible

fi
# }}}

# }}}

# run the bootstrap playbook
pushd ansible
ansible-playbook bootstrap.yml
popd

# do some symlinking of dotfiles {{{ 

ln -sf ~/muhdotfiles/.vimrc ~/.vimrc
ln -sf ~/muhdotfiles/.vim/ ~/.vim

ln -sf ~/muhdotfiles/.bashrc ~/.bashrc
ln -sf ~/muhdotfiles/.bash_profile ~/.bash_profile
ln -sf ~/muhdotfiles/.profile ~/.profile

ln -sf ~/muhdotfiles/.gitconfig ~/.gitconfig

ln -sf ~/muhdotfiles/.tmux.conf ~/.tmux.conf

# }}}

#need to distinguish between MAC, DEB, and RHEL family
#OR just run ansible script. This sounds better
#now i need to just install ansible on each box depending on OS

# RHEL family specific {{{

# yum install -y git vim wget curl rsync nc 

# golang setup

# ansible setup {{{

# yum update -y python ruby
# yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
# yum install -y python-setuptools python-yaml python-jinja2 python-paramiko python-crypto libselinux-python ansible

# ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
# cat ~/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
# chmod 600 /root/.ssh
# chmod 700 /root/.ssh/authorized_keys

# chmod -x ~/ansible/hosts

# }}}
# libevent + tmux {{{

# pushd ~
# 
# yum install -y ncurses-devel
# yum install -y gclibc-static
# 
# wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
# tar xzvf libevent-2.0.22-stable.tar.gz
# cd libevent-2.0.22-stable
# ./configure && make && make install
# 
# wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
# tar xzvf tmux-2.2.tar.gz
# cd tmux-2.2
# ./configure && make && make install
# popd 
# 
# }}}

# }}}

# Mac Specific {{{

# Remap CAPS to CTRL {{{

# tell application "System Preferences"
#   activate
#   set current pane to pane "com.apple.preference.keyboard"
# end tell
# 
# tell application "System Events"
#   tell application process "System Preferences"
#     get properties
#     
#     click button "Modifier Keys…" of tab group 1 of window "Keyboard"
#     tell sheet 1 of window "Keyboard"
#       click pop up button 4
#       click menu item 2 of menu 1 of pop up button 4
#       click button "OK"
#     end tell
#   end tell
#   
#   tell application "System Preferences" to quit
# end tell
# }}}

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
#brew install vim --override-system-vim
#brew install tmux

#brew cask install google-chrome
#brew cask install virtualbox
#brew cask install vlc

# }}}

#Debian Family Specific {{{
#
#}}}
source ~/.bash_profile
