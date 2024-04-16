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

# Link neovim config files.
nvim_config="${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
ln -s $(pwd)/nvim $nvim_config

# Install Node.js.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux (Using Ubuntu)
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install node
fi

# Link tmux config files.
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

# Link inputrc if current shell is bash.
if [[ "$SHELL" == *bash ]]; then
  ln -s $(pwd)/inputrc $HOME/.inputrc
fi
