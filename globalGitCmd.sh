#!/usr/bin/env bash

function usage()
{
	echo Usage ./globalGitCmd.sh.sh [file with list of git folder] [your git command]
	echo Ex: ./globalGitCmd.sh.sh /some/path/gitFolders.txt "git pull origin master"
	echo Ex: ./globalGitCmd.sh.sh /some/path/gitFolders.txt "git status"
}

if [ -z "$2" ]
then
	usage
fi

if [ -n "$2" ]
then
	listOfRepo="$1"
	currentPath=$PWD
	
	cat $listOfRepo | while read line
	do
		cd $currentPath
		cd "$line/.."
		projectName=$(basename $(git rev-parse --show-toplevel))
		echo "----------------------------------------------"
		echo Working on $projectName
		$2
	done
fi
