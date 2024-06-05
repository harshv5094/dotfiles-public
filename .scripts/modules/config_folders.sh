#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh

# nvim
if [ -d "$HOME/.config/nvim" ]; then
	echo_danger "Deleting Existing Nvim Config Folder"
	rm -rf "$HOME/.config/nvim"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Nvim Config Folder"
	else
		echo_error "Failed to delete Nvim Config Folder"
	fi
	echo_info "Linking Nvim Config Folder"
	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Nvim Config Folder"
	else
		echo_error "Failed to link Nvim Config Folder"
	fi
else
	echo_info "Linking Nvim Config Folder"
	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Nvim Config Folder"
	else
		echo_error "Failed to link Nvim Config Folder"
	fi
fi

# doom emacs
if [ -d "$HOME/.config/doom" ]; then
	echo_danger "Deleting Existing doom Config Folder"
	rm -rf "$HOME/.config/doom"
	if [ $? -eq 0 ]; then
		echo_success "Deleted doom Config Folder"
	else
		echo_error "Failed to delete doom Config Folder"
	fi
	echo_info "Linking doom Config Folder"
	ln -s "$HOME/.dotfiles/.config/doom" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked doom Config Folder"
	else
		echo_error "Failed to link doom Config Folder"
	fi
else
	echo_info "Linking doom Config Folder"
	ln -s "$HOME/.dotfiles/.config/doom" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked doom Config Folder"
	else
		echo_error "Failed to link doom Config Folder"
	fi
fi

# tmux
if [ -d "$HOME/.config/tmux" ]; then
	echo_danger "Deleting Existing Tmux Config Folder"
	rm -rf "$HOME/.config/tmux"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Tmux Config Folder"
	else
		echo_error "Failed to delete Tmux Config Folder"
	fi
	echo_info "Linking Tmux Config Folder"
	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Tmux Config Folder"
	else
		echo_error "Failed to link Tmux Config Folder"
	fi
else
	echo_info "Linking Tmux Config Folder"
	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Tmux Config Folder"
	else
		echo_error "Failed to link Tmux Config Folder"
	fi
fi

# kitty
if [ -e "$HOME/.config/kitty" ]; then
	echo_danger "Deleting Existing Kitty Config"
	rm -rf "$HOME/.config/kitty"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Kitty Config"
	else
		echo_error "Failed to delete Kitty Config"
	fi
	echo_info "Linking Kitty Config"
	ln -s "$HOME/.dotfiles/.config/kitty" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Kitty Config"
	else
		echo_error "Failed to link Kitty Config"
	fi
else
	echo_info "Linking Kitty Config"
	ln -s "$HOME/.dotfiles/.config/kitty" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Kitty Config"
	else
		echo_error "Failed to link Kitty Config"
	fi
fi

# alacritty
if [ -e "$HOME/.config/alacritty" ]; then
	echo_danger "Deleting Existing Alacritty Config"
	rm -rf "$HOME/.config/alacritty"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Alacritty Config"
	else
		echo_error "Failed to delete Alacritty Config"
	fi
	echo_info "Linking alacritty Config"
	ln -s "$HOME/.dotfiles/.config/alacritty" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Alacritty Config"
	else
		echo_error "Failed to link Alacritty Config"
	fi
else
	echo_info "Linking alacritty Config"
	ln -s "$HOME/.dotfiles/.config/alacritty" "$HOME/.config/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Alacritty Config"
	else
		echo_error "Failed to link Alacritty Config"
	fi
fi

# lazygit
if [ -e "$HOME/.config/lazygit/config.yml" ]; then
	echo_danger "Deleting Existing Lazygit Config"
	rm -rf "$HOME/.config/lazygit"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Lazygit Config"
	else
		echo_error "Failed to delete Lazygit Config"
	fi
	echo_info "Linking Lazygit Config"
	mkdir -p "$HOME/.config/lazygit/"
	ln -s "$HOME/.dotfiles/.config/lazygit/config.yml" "$HOME/.config/lazygit/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Lazygit Config"
	else
		echo_error "Failed to link Lazygit Config"
	fi
else
	echo_info "Linking Lazygit Config"
	mkdir -p "$HOME/.config/lazygit/"
	ln -s "$HOME/.dotfiles/.config/lazygit/config.yml" "$HOME/.config/lazygit/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Lazygit Config"
	else
		echo_error "Failed to link Lazygit Config"
	fi
fi

# Btop
if [ -e "$HOME/.config/btop/btop.conf" ]; then
	echo_danger "Deleting Existing Btop Config"
	rm -rf "$HOME/.config/btop"
	if [ $? -eq 0 ]; then
		echo_success "Deleted Btop Config"
	else
		echo_error "Failed to delete Lazygit Config"
	fi
	echo_info "Linking Btop Config"
	mkdir -p "$HOME/.config/btop/"
	ln -s "$HOME/.dotfiles/.config/btop/btop.conf" "$HOME/.config/btop/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Btop Config"
	else
		echo_error "Failed to link Btop Config"
	fi
else
	echo_info "Linking Lazygit Config"
	mkdir -p "$HOME/.config/btop/"
	ln -s "$HOME/.dotfiles/.config/btop/btop.conf" "$HOME/.config/btop/"
	if [ $? -eq 0 ]; then
		echo_success "Linked Btop Config"
	else
		echo_error "Failed to link Btop Config"
	fi
fi
