#!/bin/bash

# For now, I'm assuming this repo is in my specific Dropbox filepath
FILEPATH=${HOME}/Dropbox/dotfiles

# Revert oh-my-zsh and oh-my-tmux to master branch
git submodule update -f
# Add custom plugins to oh-my-zsh directory
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Without the -n it adds a symlinked directory with the same name inside its own directory
ln -s -f -n $FILEPATH/oh-my-zsh ${HOME}/.oh-my-zsh
ln -s -f $FILEPATH/vimrc ${HOME}/.vimrc
ln -s -f $FILEPATH/zshrc ${HOME}/.zshrc
ln -s -f $FILEPATH/tmux.conf.local ${HOME}/.tmux.conf.local
ln -s -f $FILEPATH/oh-my-tmux/.tmux.conf ${HOME}/.tmux.conf

# Create nvim directories if they don't exist
mkdir -p ${HOME}/.vim
mkdir -p ${HOME}/.config/nvim

# Create UltiSnips in .vim folder
ln -s -f $FILEPATH/UltiSnips ${HOME}/.vim/UltiSnips

# Finally link Neovim's config
ln -s -f $FILEPATH/vimrc ${HOME}/.config/nvim/init.vim

# Install vim-plug (Unix)
# Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Vim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
