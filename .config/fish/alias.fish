if type -q nvim
    alias vim-edit "nvim ~/.dotfiles/.config/nvim/"
    alias fish-edit "nvim ~/.dotfiles/.config/fish/"
    alias tmux-edit "nvim ~/.dotfiles/.config/tmux/"
    alias script-edit "nvim ~/.dotfiles/.scripts/install.sh"
    alias posh-edit "nvim ~/.dotfiles/.config/themes/linux.omp.toml"
end

if type -q lazygit
    alias lg lazygit
end

if type -q bat
    alias os-info "bat /etc/os-release"
end

if type -q htop
    alias top htop
end

if type -q kitty
    alias kitty_config "nvim ~/.dotfiles/.config/kitty"
end

alias ide "$HOME/.dotfiles/.scripts/modules/ide.sh"
alias security "sudo $HOME/.dotfiles/.scripts/modules/security.sh"
alias zoxide_weight "zoxide query -l -s | less"

# Source python in venv
alias python-start "source ~/.venv/bin/activate.fish"

alias temp_delete "sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"
alias clipboard "nvim ~/.local/share/clipman.json"
alias posh-install "curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- d /bin"
