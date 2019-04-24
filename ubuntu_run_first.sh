# this completes the manual handle jiggling to get the dotfiles installed on a fresh ubuntu box
# run this in the mudotfiles directory

# update apt-get
apt-get update
apt-get upgrade -y

# install basics
apt-get install -y unzip htop tmux git tree vim make rsync openssh-server nmap
echo "------ basics install complete ------"

# install specials
add-apt-repository -y ppa:neovim-ppa/stable
apt-get update
apt-get install -y neovim
echo "------ specials install complete ------"

# backup dot files
echo "------ backing up dotfiles, takes a min or 2 ------"
NOW=$(date "+%Y.%m.%d-%H.%M.%S")
rsync -a /home/$SUDO_USER/.[^.]* /home/$SUDO_USER/backup_dots_$NOW
echo "------ backup complete ------"

# ensure you have perms for everything in your user folder in case you migrated
chown -R $SUDO_USER:$SUDO_USER .
echo "------ perms set to current user complete ------"

# git submodules, clean up first, then run update
rm -r .tmux/plugins/* # clean out submodules so recursive submodules complete
rm -r .vim/bundle/*
git submodule foreach git clean --force -d
git submodule update --init --recursive --remote
echo "------ git submodule clean / init / update complete ------"

# fzf
rm -r /home/$SUDO_USER/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$SUDO_USER/.fzf
chmod +x /home/$SUDO_USER/.fzf/install
yes | /home/$SUDO_USER/.fzf/install
echo "------ fzf complete ------"


# ripgrep
mkdir -pv /home/$SUDO_USER/projects/ && cd /home/$SUDO_USER/projects/
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb
echo "------ ripgrep complete ------"

# cleanup
apt autoremove -y
rm -v ripgrep_*.deb
echo "------ clean complete ------"

## set all bindings
#make world
#echo "------ mudotfiles 'make world' complete ------"

chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/
echo "------ perm fix complete ------"

echo "------ ubuntu first run script complete ------"
