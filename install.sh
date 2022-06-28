#!/bin/bash
#
# Installs dotfiles and dependencies.

# Install neovim.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  sudo curl -Lo /usr/local/bin/nvim https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  sudo chmod a+x /usr/local/bin/nvim
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install neovim
fi

# Install vim-plug.
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Link tmux config files.
ln -s tmux.conf $HOMW/.tmux.conf

# Link neovim config files.
nvim_config="${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
mkdir $nvim_config
ln -s init.vim $nvim_config/init.vim
ln -s lsp.lus $nvim_config/lsp.lua

# Install Node.js, deno and pyright.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux (Using Ubuntu)
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
  sudo npm install -g pyright
  curl -fsSL https://deno.land/x/install/install.sh | sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install pyright
  brew install deno
fi

# Install deno.
