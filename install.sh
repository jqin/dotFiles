#!/bin/bash

# Exit on error
set -e

# Helper function for logging
log() {
  echo "==========================="
  echo "$1"
  echo "==========================="
}

# Install oh-my-zsh and plugins
install_oh_my_zsh() {
  log "Installing oh-my-zsh..."
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  local p10k_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k"
  if [ ! -d "$p10k_dir" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
  fi

  local syntax_highlighting_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  if [ ! -d "$syntax_highlighting_dir" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$syntax_highlighting_dir"
  fi
}

# Install vim-plug
install_vim_plug() {
  log "Installing vim-plug..."
  local plug_vim="$HOME/.vim/autoload/plug.vim"
  if [ ! -f "$plug_vim" ]; then
    curl -fLo "$plug_vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

# Install tpm
install_tpm() {
  log "Installing tpm..."
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

# Create symlinks
create_symlinks() {
  log "Creating symlinks..."
  ln -sfv "$(pwd)/zsh/.zshrc" "$HOME/.zshrc"
  ln -sfv "$(pwd)/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
  ln -sfv "$(pwd)/vim/.vimrc" "$HOME/.vimrc"
  ln -sfv "$(pwd)/vim/.vim" "$HOME/.vim"
  ln -sfv "$(pwd)/tmux/.tmux.conf" "$HOME/.tmux.conf"
  ln -sfv "$(pwd)/git/.gitconfig" "$HOME/.gitconfig"
  ln -sfv "$(pwd)/git/.gitignore" "$HOME/.gitignore"
  ln -sfv "$(pwd)/git/.git-completion.bash" "$HOME/.git-completion.bash"
  ln -sfv "$(pwd)/git/.git-prompt.sh" "$HOME/.git-prompt.sh"
}

# Main function
main() {
  install_oh_my_zsh
  install_vim_plug
  install_tpm
  create_symlinks
  log "Installation complete!"
}

main "$@"
