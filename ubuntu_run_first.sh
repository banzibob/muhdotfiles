# this completes the manual handle jiggling to get the dotfiles installed on a fresh ubuntu box
# run this in the mudotfiles directory

# update apt-get
apt-get update

# install basics
apt-get install -y unzip htop tmux git tree vim

# install specials
add-apt-repository -y ppa:neovim-ppa/stable
apt-get update
apt-get install -y neovim

# backup dot files
mkdir /home/$SUDO_USER/backup_dots
cp -v /home/$SUDO_USER/.* /home/$SUDO_USER/backup_dots

# git submodules
git submodule update --init --recursive
git submodule update --recursive --remote

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$SUDO_USER/.fzf
/home/$SUDO_USER/.fzf/install

# ripgrep
mkdir -v /home/$SUDO_USER/projects/ && cd /home/$SUDO_USER/projects/
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb
