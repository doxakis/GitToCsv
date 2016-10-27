#!/usr/bin/env bash

function usage()
{
	echo Usage ./findAllGitFolders.sh [path containing git folder] [file to store the list of git folder] [max depth for searching]
	echo Ex: ./findAllGitFolders.sh /some/folder/ /some/path/gitFolders.txt 5
}

if [ -z "$3" ]
then
	usage
fi

if [ -n "$3" ]
then
	path="$1"
	output="$2"
	maxdepth="$3"
	
	echo "Starting... (It may take some time.)"
	date
	find $path -maxdepth $maxdepth -type d -name ".git" > $output
	echo Finished!
	echo Output: $output
	date
fi
