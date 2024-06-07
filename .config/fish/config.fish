set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias g git
command -qv nvim && alias vim nvim


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Cargo
set --export PATH ~/.cargo/bin/ $PATH


# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm -s use
    else
    end
end

__check_rvm

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-linux.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

source ~/.config/fish/alias.fish

# Initializing zoxide
if type -q zoxide
    zoxide init --cmd cd fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Doom Emacs
set --export PATH $HOME/.config/emacs/bin/ $PATH

# for Linuxbrew
if test -d "/home/linuxbrew/.linuxbrew"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

# Execute colorscript by distrotube
if command -q colorscript
    colorscript -e six
end
