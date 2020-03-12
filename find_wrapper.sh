#!/bin/bash
yes="yes"
while [ "$yes" = "yes" ]
do
exitcode=0
echo "Delete files bigger than size in directory"
echo "input directory name"
read directory
if ! [ -d $directory ]; then
	echo "bad directory name" 1>&2
	exitcode=3
	echo "Again yes/no"
	read yes
else
	echo "input size in mb"
	read size
	find $directory -size +$size
	if [ $? = 0 ]; then
		echo "delete this files y/n"
		read del_files
		if [ "$del_files" = "y" ]; then
			find $directory -size +$size -delete
			if [ $? = 0 ]; then
				echo "Again yes/no"
				read yes
			else
				echo "can't delete" >&2
				exitcode=2
				echo "Again yes/no"
				read yes
			fi
		else
			echo "Again yes/no"
			read yes
		fi
	else
		echo "can't find files" 1>&2
		exitcode=1
		echo "Again yes/no"
		read yes
	fi
fi
done
echo "Cancel"
exit $exitcode
