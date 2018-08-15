#!/bin/sh

echo "Hola Isard, posa el nom de la sessió:"
read session

case "$session" in
	Java)
		echo "laptop or pc?"
		read desition
		if [ $desition == laptop ];then
			# create a new tmux session, starting vim from a saved session in the new window
			tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

			# Select pane 1, set dir to api, run vim
			tmux selectp -t 1 
			tmux send-keys "cd /home/isardbp/git;vim" C-m 

			# Split pane 1 vertical, start tree 
			tmux splitw -v -p 10
			tmux send-keys "cd /home/isardbp/git;clear;tree -L 2" C-m 

			# Finished setup, attach to the tmux session!
			tmux attach-session -t $session
		else
			# create a new tmux session, starting vim from a saved session in the new window
			tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

			# Select pane 1, set dir to api, run vim
			tmux selectp -t 1 
			tmux send-keys "cd /home/isardbp/git;vim" C-m 

			# Split pane 1 horizontal, start tree 
			tmux splitw -h -p 10
			tmux send-keys "cd /home/isardbp/git;clear;tree -L 2" C-m 

			# Finished setup, attach to the tmux session!
			tmux attach-session -t $session
		fi
	;;
	Mysql)
		echo "User: "
		read user
		# create a new tmux session, starting vim from a saved session in the new window
		tmux new-session -d -s $session -n mysql
		echo "ip?"
		read ip

		if [ $ip == no ];then
			echo "Start mydqld service?"
			read desition
			if [ $desition == yes ]; then 
				tmux send-keys "systemctl start mysqld.service;mysql -u $user -p" C-m 
			else	
				tmux send-keys "mysql -u $user -p" C-m
			fi
		else

			echo "Start mydqld service?"
			read desition
			if [ $desition == yes ]; then 
				tmux send-keys "systemctl start mysqld.service;mysql -u $user -h $ip -p" C-m 
			else	
				tmux send-keys "mysql -u $user -h $ip -p" C-m
			fi
		fi
		#Finished setup, attach to the tmux session!
		tmux attach-session -t $session
	;;
	ssh)
		echo "ip: "
		read ip
		# create a new tmux session, starting vim from a saved session in the new window
		tmux new-session -d -s $session -n ssh

		echo "Start sshd service?"
		read desition
		if [ $desition == yes ]; then 
			tmux send-keys "systemctl start sshd; ssh $ip" C-m 
		else
			tmux send-keys "ssh $ip" C-m
		fi
		#Finished setup, attach to the tmux session!
		tmux attach-session -t $session
	;;
	*)
		exit 0;
esac
