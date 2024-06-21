#!/bin/bash

# Prompt the user to enter a directory path
read -p "Enter directory path (or press Enter to use the current directory): " dir_path

# Use the current directory if no path is provided
if [ -z "$dir_path" ]; then
	dir_path=$(pwd)
fi

# Check if the directory exists
if [ ! -d "$dir_path" ]; then
	echo "Invalid directory path"
	exit 1
fi

# Create a new tmux session and navigate to the specified directory
tmux new-session -d -s ide -c "$dir_path"

# Execute tmux commands within the new session
tmux send-keys -t ide "tmux split-window -v -l 30%" C-m
# tmux send-keys -t ide "tmux split-window -h -l 66%" C-m
tmux send-keys -t ide "tmux split-window -h -l 50%" C-m

# Attach to the new session
tmux attach -t ide
