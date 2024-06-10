#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh
source ~/.dotfiles/.scripts/modules/cmd_check.sh

# .bashrc
if [ -e "$HOME/.bashrc" ]; then
	echo_danger "Deleting Existing .bashrc"
	rm "$HOME/.bashrc"
	delete_file_check ".bashrc"

	echo_info "Linking .bashrc"
	ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/"
	link_file_check ".bashrc"
else
	echo_info "Linking .bashrc"
	ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/"
	delete_file_check ".bashrc"
fi

# .zshrc
if [ -e "$HOME/.zshrc" ]; then
	echo_danger "Deleting Existing .zshrc"
	rm "$HOME/.zshrc"
	delete_file_check ".zshrc"

	echo_info "Linking .zshrc"
	ln -s "$HOME/.dotfiles/dot/.zshrc" "$HOME/"
	link_file_check ".zshrc"
else
	echo_info "Linking .zshrc"
	ln -s "$HOME/.dotfiles/dot/.zshrc" "$HOME/"
	link_file_check ".zshrc"
fi

# .bash_aliases
if [ -e "$HOME/.bash_aliases" ]; then
	echo_danger "Deleting Existing .bash_aliases"
	rm "$HOME/.bash_aliases"
	delete_file_check ".bash_aliases"

	echo_info "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	link_file_check ".bash_aliases"
else
	echo_info "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	link_file_check ".bash_aliases"
fi

# .zsh_aliases
if [ -e "$HOME/.zsh_aliases" ]; then
	echo_danger "Deleting Existing .zsh_aliases"
	rm "$HOME/.zsh_aliases"
	delete_file_check ".zsh_aliases"

	echo_info "Linking .zsh_aliases"
	ln -s "$HOME/.dotfiles/dot/.zsh_aliases" "$HOME/.zsh_aliases"
	link_file_check ".zsh_aliases"
else
	echo_info "Linking .zsh_aliases"
	ln -s "$HOME/.dotfiles/dot/.zsh_aliases" "$HOME/.zsh_aliases"
	link_file_check ".zsh_aliases"
fi

# .gitconfig
if [ -e "$HOME/.gitconfig" ]; then
	echo_danger "Deleting Existing .gitconfig"
	rm "$HOME/.gitconfig"
	delete_file_check ".gitconfig"

	echo_info "Copying .gitconfig"
	cp "$HOME/.dotfiles/dot/.gitconfig" "$HOME/"
	copy_file_check ".gitconfig"
else
	echo_info "Copying .gitconfig"
	cp "$HOME/.dotfiles/dot/.gitconfig" "$HOME/"
	copy_file_check ".gitconfig"
fi

# .czrc
if [ -e "$HOME/.czrc" ]; then
	echo_danger "Deleting Existing .czrc"
	rm "$HOME/.czrc"
	delete_file_check ".czrc"

	echo_info " Copying .czrc"
	cp "$HOME/.dotfiles/dot/.czrc" "$HOME/"
	copy_file_check ".czrc"
else
	echo_info "Copying .czrc"
	cp "$HOME/.dotfiles/dot/.czrc" "$HOME/"
	copy_file_check ".czrc"
fi

#.vimrc
if [ -e "$HOME/.vimrc" ]; then
	echo_danger "Deleting Existing .vimrc"
	rm "$HOME/.vimrc"
	delete_file_check ".vimrc"

	echo_info "Copying .vimrc"
	cp "$HOME/.dotfiles/dot/.vimrc" "$HOME/"
	copy_file_check ".vimrc"
else
	echo_info "Copying .vimrc"
	cp "$HOME/.dotfiles/dot/.vimrc" "$HOME/"
	copy_file_check ".vimrc"
fi
