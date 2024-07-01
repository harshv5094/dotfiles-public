# 🔨 My Dotfiles

⚠️ Warning: Don't blindly use my setup unless you know what it is. Use it at your own risk!

## Table of Contents

- [Introduction](#introduction)
- [Font Dependancy](#font-dependancy)
- [How to install my setup](#how-to-install-my-setup)

## Introduction

My setup is inspired from [craftzdog's](https://github.com/craftzdog/dotfiles-public) setup. This setup contains some of his configuration with my customization mixed in it.

## Font Dependancy

Some configuration needs nerd fonts to properly show icons. You can download the font from [here](https://www.nerdfonts.com/font-downloads). I am using `JetBrainsMono Nerd Font` in my setup.

## How to install my setup

Just copy the line below and paste in terminal:

⚠️ Please use the name `.dotfiles` for the directory and keep it in user home directory when you clone this repository. As many scripts path depends on this directory name. I'm using `GNU stow` to manage my symlinks. Use `stow --adopt .` command to create symlinks with existing files in backup. The fish config is still using my script to execute its symlink

```bash
  git clone https://github.com/harshv5094/dotfiles-public ~/.dotfiles
```

Run the script line based on your os

#### Linux and MacOS

```sh
~/.dotfiles/.scripts/install.sh
```

#### Windows

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
~/.dotfiles/.scripts/install.ps1
```

## More Repos

Window Manager -> Click [here](https://github.com/harshv5094/window-manager-setup) for setup
