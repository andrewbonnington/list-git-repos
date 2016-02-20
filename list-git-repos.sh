#!/bin/sh

regex="^\.\/(.*)\/.git$"

find . -name .git -type d -prune -maxdepth 2 -print0 | while IFS= read -r -d $'\0' line; do
    [[ $line =~ $regex ]]
    echo "${BASH_REMATCH[1]}"
done
