if command -v nvim &>/dev/null; then
	alias vim="nvim"
	alias vim-edit="nvim ~/.dotfiles/.config/nvim/"
	alias fish-edit="nvim ~/.dotfiles/.config/fish/"
	alias tmux-edti="nvim ~/.dotfiles/.config/tmux/"
	alias script-edti="nvim ~/.dotfiles/.scripts/install.sh"
fi

if command -v eza &>/dev/null; then
	alias ll="eza -lg --icons --header"
	alias ls="eza -g --icons"
	alias la="eza -lga --icons --header"
fi

if command -v lazygit &>/dev/null; then
	alias lg="lazygit"
fi

if command -v bat &>/dev/null; then
	alias os-info="bat /etc/os-release"
fi

if command -v htop &>/dev/null; then
	alias top=htop
fi

if command -v kitty &>/dev/null; then
	alias kitty="nvim ~/.dotfiles/.config/kitty"
fi

alias ide="~/.dotfiles/.scripts/ide.sh"

alias ide="~/.dotfiles/.scripts/ide.sh"

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"
