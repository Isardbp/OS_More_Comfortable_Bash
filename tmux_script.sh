#!/bin/sh
#
# Setup a work space called `work` with two windows
# first window has 3 panes. 
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server 
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`
#
echo "Hola Isard, posa el nom de la sessió:"
read session

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

# Select pane 1, set dir to api, run vim
tmux selectp -t 1 
tmux send-keys "cd /home/isardbp/git;vim" C-m 

# Split pane 1 vertical, start tree 
tmux splitw -v -p 10
tmux send-keys "cd /home/isardbp/git;clear;tree -L 2" C-m 

# Select pane 2 
#tmux selectp -t 2

# Select pane 1
#tmux selectp -t 1

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
