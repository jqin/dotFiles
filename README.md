# dotFiles

My personal dotfiles for various tools, organized for easy installation and management.

## Structure

The dotfiles are organized into directories by tool:

- `zsh/`: Contains `.zshrc` and `.p10k.zsh`
- `vim/`: Contains `.vimrc` and the `.vim` directory
- `tmux/`: Contains `.tmux.conf`
- `git/`: Contains git-related configuration files

## Installation

To install these dotfiles, clone the repository and run the `install.sh` script:

```bash
git clone https://github.com/your-username/dotfiles.git
cd dotfiles
./install.sh
```

The script will automatically handle the following:

- Installing `oh-my-zsh`, `vim-plug`, and `tpm`
- Creating symlinks for all the configuration files
