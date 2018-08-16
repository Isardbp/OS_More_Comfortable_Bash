#! /bin/bash

cd /home/isardbp/git

echo "pull or push?"
read desition

if [ $desition == pull ]; then
	for i in $(ls /home/isardbp/git); do
		echo "-------------$i--------------"
		cd /home/isardbp/git/$i
		git pull
	done
elif [ $desition == push ]; then
	echo "Push all or only one?"
	read desition
	if [ $desition == all ]; then
		
		echo "Put a global commit message like: general commit"
		read comm_mss
		for i in $(ls /home/isardbp/git); do
			cd /home/isardbp/git/$i
			git add *
			git commit -m "$comm_mss"
			git push origin master
		done
	elif [ $desition == one ]; then
		tree -L 1 /home/isardbp/git
		echo "Escull un dir: "
		read dir
		cd /home/isardbp/git/$dir
		echo "Put a global commit message like: general commit"
		read comm_mss
		git add *
		git commit -m "$comm_mss"
		git push origin master
	else
		exit 0
	fi
else
	exit 0
fi	
