#!/bin/sh

if [ $# -eq 0 ]; then
	directory="."
else
	case $1 in
		-h|--help)
			echo "Usage: list-git-repos <directory>"
			exit
			;;
	    *)
	    	if [ -d "$1" ]; then
				directory=$1
			else
				echo "$1 is not a directory"
				exit
			fi
	    	;;
	esac
fi

regex="^${directory}\/(.*)\/.git$"

find $directory -name .git -type d -prune -maxdepth 2 -print0 | while IFS= read -r -d $'\0' line; do
    [[ $line =~ $regex ]]
    echo "${BASH_REMATCH[1]}"
done
