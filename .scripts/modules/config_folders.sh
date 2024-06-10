#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh
source ~/.dotfiles/.scripts/modules/cmd_check.sh

# nvim
if [ -d "$HOME/.config/nvim" ]; then
	echo_danger "Deleting Existing Nvim Config Folder"

	rm -rf "$HOME/.config/nvim"
	delete_folder_check "Nvim"
	echo_info "Linking Nvim Config Folder"

	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	link_folder_check "Nvim"
else
	echo_info "Linking Nvim Config Folder"

	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	link_folder_check "Nvim"
fi

# doom emacs
if [ -d "$HOME/.config/doom" ]; then
	echo_danger "Deleting Existing doom Config Folder"

	rm -rf "$HOME/.config/doom"
	delete_folder_check "doom"
	echo_info "Linking doom Config Folder"

	ln -s "$HOME/.dotfiles/.config/doom" "$HOME/.config/"
	link_folder_check "doom"
else
	echo_info "Linking doom Config Folder"

	ln -s "$HOME/.dotfiles/.config/doom" "$HOME/.config/"
	link_folder_check "doom"
fi

# tmux
if [ -d "$HOME/.config/tmux" ]; then
	echo_danger "Deleting Existing Tmux Config Folder"
	rm -rf "$HOME/.config/tmux"

	delete_folder_check "Tmux"
	echo_info "Linking Tmux Config Folder"

	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	link_folder_check "Tmux"
else
	echo_info "Linking Tmux Config Folder"

	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	link_folder_check "Tmux"
fi

# kitty
if [ -e "$HOME/.config/kitty" ]; then
	echo_danger "Deleting Existing Kitty Config"
	rm -rf "$HOME/.config/kitty"

	delete_folder_check "Kitty"
	echo_info "Linking Kitty Config"

	ln -s "$HOME/.dotfiles/.config/kitty" "$HOME/.config/"
	link_folder_check "Kitty"
else
	echo_info "Linking Kitty Config"

	ln -s "$HOME/.dotfiles/.config/kitty" "$HOME/.config/"
	link_folder_check "Kitty"
fi

# alacritty
if [ -e "$HOME/.config/alacritty" ]; then
	echo_danger "Deleting Existing Alacritty Config"
	rm -rf "$HOME/.config/alacritty"

	delete_folder_check "Alacritty"
	echo_info "Linking Alacritty Config"

	ln -s "$HOME/.dotfiles/.config/alacritty" "$HOME/.config/"
	link_folder_check "Alacritty"
else
	echo_info "Linking alacritty Config"

	ln -s "$HOME/.dotfiles/.config/alacritty" "$HOME/.config/"
	link_folder_check "Alacritty"
fi

# lazygit
if [ -e "$HOME/.config/lazygit/config.yml" ]; then
	echo_danger "Deleting Existing Lazygit Config"
	rm -rf "$HOME/.config/lazygit"

	delete_folder_check "Lazygit"
	echo_info "Linking Lazygit Config"

	mkdir -p "$HOME/.config/lazygit/"
	ln -s "$HOME/.dotfiles/.config/lazygit/config.yml" "$HOME/.config/lazygit/"
	link_folder_check "Lazygit"
else
	echo_info "Linking Lazygit Config"

	mkdir -p "$HOME/.config/lazygit/"
	ln -s "$HOME/.dotfiles/.config/lazygit/config.yml" "$HOME/.config/lazygit/"

	link_folder_check "Lazygit"
fi

# Btop
if [ -e "$HOME/.config/btop/btop.conf" ]; then
	echo_danger "Deleting Existing Btop Config"
	rm -rf "$HOME/.config/btop"

	delete_folder_check "Btop"
	echo_info "Linking Btop Config"

	mkdir -p "$HOME/.config/btop/"
	ln -s "$HOME/.dotfiles/.config/btop/btop.conf" "$HOME/.config/btop/"
	link_folder_check "Btop"
else
	echo_info "Linking Lazygit Config"

	mkdir -p "$HOME/.config/btop/"
	ln -s "$HOME/.dotfiles/.config/btop/btop.conf" "$HOME/.config/btop/"

	link_folder_check "Btop"
fi
