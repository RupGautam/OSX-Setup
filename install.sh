#!/bin/bash
# @author Rup Gautam

[[ -d ~/.vim ]] || mkdir ~/.vim;

# tmp dir
[[ -d ~/temp ]] || mkdir ~/temp;

#Check if brew is installed and update if 'yes'
if type brew > /dev/null; then
  echo "Homebrew Exists";
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi;
brew update && brew upgrade && brew cleanup;
brew install zsh zsh-completions;

#gitconfig
cp ~/temp/OSX-Setup/.gitconfig ~/.gitconfig;

#Installing oh-my-zsh and copying .zshrc
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh;
cp -r ~/temp/OSX-Setup/.oh-my-zsh ~ ; #copying my entire folder
cp ~/temp/OSX-Setup/.zshrc ~/.zshrc;
echo "installed oh-my-zsh and .zshrc config file copied successfully";

#install and configure atom-ide
brew install atom;
cp -r ~/temp/OSX-Setup/.atom ~ ;
echo "atom installed and config files copied successfully!";

# Clone setup repo
cd ~/temp;
[[ -d ~/temp/rc ]] || git clone https://github.com/RupGautam/OSX-Setup.git;

# Copy all the dotfiles
cp ~/temp/OSX-Setup/.bash_profile ~/.bash_profile;
cp ~/temp/OSX-Setup/.bashrc ~/.bashrc;
cp -r ~/temp/OSX-Setup/.nano ~ ;
cp ~/temp/OSX-Setup/.nanorc ~/.nanorc;
cp ~/temp/OSX-Setup/.alias ~/.alias;
cp ~/temp/OSX-Setup/.screenrc ~/.screenrc;
echo "All necessary dotfiles has been copied successfully!";


# backup origin vimrc file
[[ -f ~/.vimrc-bak ]] || cp ~/.vimrc ~/.vimrc-bak;
mv ~/temp/OSX-Setup/.vimrc ~/.vimrc;
echo ".vimrc backed-up old one and copied fresh one successfully!";

# vim pulgin controller - vundle
[[ -d ~/.vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
echo "VundleVim installed successfully!";

# colors schemes
cd ~/temp;
[[ -d ~/temp/vim-colorschemes ]] || git clone https://github.com/flazz/vim-colorschemes.git;
[[ -d ~/.vim/colors ]] || mv ~/temp/vim-colorschemes/colors ~/.vim/;
echo "Vim vim-colorschemes installed successfully!";

# fonts for airline
cd  ~/temp;
[[ -d ~/temp/fonts ]] || git clone https://github.com/powerline/fonts.git;
echo "You might have to provide admin password to install powerline fonts";
cd fonts;
sudo sh ./install.sh;
echo "powerline fonts installed successfully!";

# ack supported
brew install ack ag;

# YouCompleteMe supported
echo "installing YouCompleteMe vim plugin, this might takes time";
if [[ -d ~/.vim/bundle/YouCompleteMe ]]; then
  echo "YouCompleteMe Exists";
else
  git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe;
  cd ~/.vim/bundle/YouCompleteMe;
  git submodule update --init --recursive
  # for nodejs
  ./install.py --tern-completer;
fi;
echo "Done, installing YouCompleteMe successfully!";


# update vim, replace the origin
# brew install vim --override-system-vi --with-lua --HEAD;

# install vim plugins
vim +PluginInstall! +qall;

# rm tmp dir
rm -rf ~/temp;

#Manual setting notice.
echo "Please install Sublime Text and manually copy the Preferences setting"