#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh

function package_install() {
	if command -v dnf &>/dev/null; then
		echo_info "Installing dnf packages"
		if command -v lazygit &>/dev/null; then
			echo_info "Lazygit copr is enabled"
		else
			echo_info "Enabling lazygit copr"
			sudo dnf copr enable atim/lazygit -y
		fi
		sudo dnf makecache
		sudo dnf install $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/dnf.txt | tr "\n" " ")
		return
	fi

	if command -v nala &>/dev/null; then
		echo_info "Installing nala packages"
		sudo nala install $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/apt.txt | tr "\n" " ")
		return
	else
		echo_info "Installing nala"
		sudo apt update && sudo apt upgrade -y
		sudo apt install nala
		echo_info "Installing nala packages"
		sudo nala fetch
		sudo nala install $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/apt.txt | tr "\n" " ")
		return
	fi

	# if command -v pacman &>/dev/null; then
	# 	echo_info "Installing pacman packages"
	# 	sudo pacman -S $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/pacman.txt | tr "\n" " ")
	# 	return
	# fi
}

function install-nix-packages() {
	if command -v nix-env &>/dev/null; then
		echo_info "Installing Nix packages"
		nix-env -iA $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/nix.txt | tr "\n" " ")
	fi
}

function flatpak_package_install() {
	if command -v flatpak &>/dev/null; then
		echo_info "Installing flatpak packages"
		flatpak install $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/flatpak.txt | tr "\n" " ")
	fi
}

function welcome() {
	echo -e "Welcome to My Setup installation script."
	PS3="Your Option: "
	options=("Link My Dotfiles and Config Folders 🫥" "Install My Packages 📦" "Install Homebrew and its Packages 🍺" "Install Nix (Multi User) 🕸️" "Install Nix packages 🕸️" "Install Flatpak Packages 💙" "Run My Fish Configuration script 🐟")

	select SELECTED_OPTIONS in "${options[@]}"; do
		case "${SELECTED_OPTIONS}" in

		"Link My Dotfiles and Config Folders 🫥")
			~/.dotfiles/.scripts/modules/dotfiles.sh
			~/.dotfiles/.scripts/modules/config_folders.sh
			break
			;;

		"Install My Packages 📦")
			package_install
			break
			;;

		"Install Homebrew and its Packages 🍺")
			~/.dotfiles/.scripts/modules/brew_check_and_install.sh
			break
			;;

		"Install Nix (Multi User) 🕸️")
			curl -L https://nixos.org/nix/install | sh -s -- --daemon
			break
			;;

		"Install Nix packages 🕸️")
			install-nix-packages
			break
			;;

		"Install Flatpak Packages 💙")
			flatpak_package_install
			break
			;;

		"Run My Fish Configuration script 🐟")
			~/.dotfiles/.scripts/modules/fish.sh
			break
			;;

		*)
			echo_danger "Ooops Wrong Option"
			break
			;;

		esac
	done
}
welcome
