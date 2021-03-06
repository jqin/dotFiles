help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make all                         install everything                 '
	@echo '   make install_zsh                 install zsh conf files             '
	@echo '   make install_vim                 install vim conf files             '
	@echo '   make install_tmux                install tmux conf files            '
	@echo '   make install_git                 install git conf files             '
	@echo '                                                                       '

all: install_oh_my_zsh install_zsh install_vim install_tmux install_git
	@echo "==========================="
	@echo "Installing all dot files..."
	@echo "==========================="
	@echo "Done!"

install_oh_my_zsh:
	@echo Installing oh-my-zsh
	sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

install_zsh:
	ln -sf `pwd`/.zshrc ~/.zshrc
	ln -sf `pwd`/.p10k.zsh ~/.p10k.zsh

install_vim:
	ln -sf `pwd`/.vimrc ~/.vimrc
	ln -sf `pwd`/.vim   ~/.vim
	@echo Installing vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install_tmux:
	ln -sf `pwd`/.tmux.conf     ~/.tmux.conf
	ln -sf `pwd`/.tmux_snapshot ~/.tmux_snapshot

install_git:
	ln -sf `pwd`/.gitconfig           ~/.gitconfig
	ln -sf `pwd`/.gitignore           ~/.gitignore
	ln -sf `pwd`/.git-completion.bash ~/.git-completion.bash
	ln -sf `pwd`/.git-prompt.sh       ~/.git-prompt.sh

