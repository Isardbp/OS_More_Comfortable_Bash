#! /bin/bash

cd /home/isardbp/git

echo "add, commit and push all?"
read desition

if [ $desition == yes ]; then
	git add *
	echo "commit message: "
	read comm_mss
	git commit -m "$comm_mss"
	git push origin master
else
	tree -L 1
	for i in $(ls);
	do
		echo "------------$i----------------"
		cd /home/isardbp/git/$i
		git status
	done
	echo "Repository:"
	read repo
	cd $repo
	echo "commit message: "
	read comm_mss
	git commit -m "$comm_mss"
	echo "Push origin master?"
	read desition
	if [ $desition == yes ]; then
		git push origin master
	else
		exit 0
	fi
fi

