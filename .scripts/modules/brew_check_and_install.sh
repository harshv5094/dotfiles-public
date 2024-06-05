#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh

if command -v brew &>/dev/null; then
	echo_warning "Homebrew is not installed in your system"
	echo_info "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ $? -eq 0 ]; then
		echo_success "Homebrew is installed successfully"
	else
		echo_error "Failed to install Homebrew"
	fi
else
	echo_error "Homebrew is installed in your system"
fi

if command -v brew &>/dev/null; then
	echo_info "Installing Homebrew Packages"
	# Brew File
	if [ -e "$HOME/Brewfile" ]; then
		echo_danger "Deleting Existing Brewfile"
		rm "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Deleted Brewfile"
		else
			echo_error "Failed to delete Brewfile"
		fi
		echo_info "Linking Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Linked Brewfile"
		else
			echo_error "Failed to link Brewfile"
		fi
	else
		echo_info "Linking Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Linked Brewfile"
		else
			echo_error "Failed to link Brewfile"
		fi
	fi
	brew bundle install --file="$HOME/Brewfile"
else
	echo_warning "Homebrew is not installed in your system"
	echo_info "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ $? -eq 0 ]; then
		echo_success "Homebrew is installed successfully"
	else
		echo_error "Failed to install Homebrew"
	fi

	echo_info "Installing Homebrew Packages"
	# Brew File
	if [ -e "$HOME/Brewfile" ]; then
		echo_danger "Deleting Existing Brewfile"
		rm "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Deleted Brewfile"
		else
			echo_error "Failed to delete Brewfile"
		fi
		echo_info "Linking Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Linked Brewfile"
		else
			echo_error "Failed to link Brewfile"
		fi
	else
		echo_info "Linking Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
		if [ $? -eq 0 ]; then
			echo_success "Linked Brewfile"
		else
			echo_error "Failed to link Brewfile"
		fi
	fi
	brew bundle install --file="$HOME/Brewfile"
fi
