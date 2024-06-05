#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh

# .bashrc
if [ -e "$HOME/.bashrc" ]; then
	echo_danger "Deleting Existing .bashrc"
	rm "$HOME/.bashrc"
	if [ $? -eq 0 ]; then
		echo_success "Deleted .bashrc"
	else
		echo_error "Failed to delete .bashrc"
	fi
	echo_info "Copying .bashrc"
	cp "$HOME/.dotfiles/dot/.bashrc" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .bashrc"
	else
		echo_error "Failed to copy .bashrc"
	fi
else
	echo_info "Copying .bashrc"
	cp "$HOME/.dotfiles/dot/.bashrc" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .bashrc"
	else
		echo_error "Failed to copy .bashrc"
	fi
fi

# .bash_aliases
if [ -e "$HOME/.bash_aliases" ]; then
	echo_danger "Deleting Existing .bashrc"
	rm "$HOME/.bash_aliases"
	if [ $? -eq 0 ]; then
		echo_success "Deleted .bash_aliases"
	else
		echo_error "Failed to delete .bash_aliases"
	fi
	echo_info "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	if [ $? -eq 0 ]; then
		echo_success "Linked .bash_aliases"
	else
		echo_error "Failed to link .bash_aliases"
	fi
else
	echo_info "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	if [ $? -eq 0 ]; then
		echo_success "Linked .bash_aliases"
	else
		echo_error "Failed to link .bash_aliases"
	fi
fi

# .gitconfig
if [ -e "$HOME/.gitconfig" ]; then
	echo_danger "Deleting Existing .gitconfig"
	rm "$HOME/.gitconfig"
	if [ $? -eq 0 ]; then
		echo_success "Deleted .gitconfig"
	else
		echo_error "Failed to delete .gitconfig"
	fi
	echo_info "Copying .gitconfig"
	cp "$HOME/.dotfiles/dot/.gitconfig" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .gitconfig"
	else
		echo_error "Failed to copy .gitconfig"
	fi
else
	echo_info "Copying .gitconfig"
	cp "$HOME/.dotfiles/dot/.gitconfig" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .gitconfig"
	else
		echo_error "Failed to copy .gitconfig"
	fi
fi

# .Xmodmap
if [ -e "$HOME/.Xmodmap" ]; then
	echo_danger "Deleting Existing .Xmodmap"
	rm "$HOME/.Xmodmap"
	if [ $? -eq 0 ]; then
		echo_success "Deleted .Xmodmap"
	else
		echo_error "Failed to delete .Xmodmap"
	fi
	echo_info " Copying .Xmodmap"
	cp "$HOME/.dotfiles/dot/.Xmodmap" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .Xmodmap"
	else
		echo_error "Failed to copy .Xmodmap"
	fi
else
	echo_info "Copying .Xmodmap"
	cp "$HOME/.dotfiles/dot/.Xmodmap" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .Xmodmap"
	else
		echo_error "Failed to copy .Xmodmap"
	fi
fi

# .czrc
if [ -e "$HOME/.czrc" ]; then
	echo_danger "Deleting Existing .czrc"
	rm "$HOME/.czrc"
	if [ $? -eq 0 ]; then
		echo_success "Deleted .czrc"
	else
		echo_error "Failed to delete .czrc"
	fi
	echo_info " Copying .czrc"
	cp "$HOME/.dotfiles/dot/.czrc" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .czrc"
	else
		echo_error "Failed to copy .czrc"
	fi
else
	echo_info "Copying .czrc"
	cp "$HOME/.dotfiles/dot/.czrc" "$HOME/"
	if [ $? -eq 0 ]; then
		echo_success "Successfully copied .czrc"
	else
		echo_error "Failed to copy .czrc"
	fi
fi
