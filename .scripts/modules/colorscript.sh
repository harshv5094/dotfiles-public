#!/usr/bin/env bash

source ~/.dotfiles/.scripts/modules/colors.sh

echo_info "Installing ColorScript"
git clone https://gitlab.com/dwt1/shell-color-scripts.git ~/Documents/shell-color-scripts
cd ~/Documents/shell-color-scripts || exit
sudo make install

# For fish shell completion
sudo cp completions/colorscript.fish /usr/share/fish/vendor_completions.d

if [ $? -eq 0 ]; then
	echo_success "ColorScript installed successfully"
else
	echo_error "Failed to install ColorScript"
fi
