if command -v nvim &>/dev/null; then
	alias vim="nvim"
	alias vim-edit="nvim ~/.dotfiles/.config/nvim/"
	alias fish-edit="nvim ~/.dotfiles/.config/fish/"
	alias tmux-edti="nvim ~/.dotfiles/.config/tmux/"
	alias script-edti="nvim ~/.dotfiles/.scripts/install.sh"
fi

if command -v eza &>/dev/null; then
	alias ll="eza -l -g --icons --header"
	alias lla="ll -a"
fi

if command -v lazygit &>/dev/null; then
	alias lg="lazygit"
fi

if command -v bat &>/dev/null; then
	alias os-info="bat /etc/os-release"
fi

if command -v kitty &>/dev/null; then
	alias kitty="nvim ~/.dotfiles/.config/kitty"
fi

alias ide="~/.dotfiles/.scripts/ide.sh"

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"
alias clipboard="nvim ~/.local/share/clipman.json"
alias posh-install="curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- d /bin"
alias remove-nvim-plugin="rm -rf $HOME/.local/share/nvim/ $HOME/.local/state/nvim/ $HOME/.cache/nvim/"
