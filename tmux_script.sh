#!/bin/sh

echo "Hola Isard, posa el nom de la sessió:"
read session

case "$session" in
	Java)
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
	;;
	Mysql)
		# create a new tmux session, starting vim from a saved session in the new window
		tmux new-session -d -s $session -n mysql

		# Select pane 1, start mysql and run mysql
		tmux selectp -t 1 
		tmux send-keys "systemctl start mysqld.service;mysql -u root -p" C-m 

		# Finished setup, attach to the tmux session!
		tmux attach-session -t $session
	;;
	ssh)
		# create a new tmux session, starting vim from a saved session in the new window
		tmux new-session -d -s $session -n ssh

		# Select pane 1, start ssh and run ssh
		tmux selectp -t 1 
		tmux send-keys "systemctl start sshd; ssh 127.0.0.1" C-m 

		# Finished setup, attach to the tmux session!
		tmux attach-session -t $session
	;;
	*)
		exit 0;
esac
