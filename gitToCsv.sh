#!/usr/bin/env bash

function usage()
{
	echo Usage ./gitToCsv.sh [file with list of git folder] [file to store the csv output]
	echo Ex: ./gitToCsv.sh /some/path/gitFolders.txt /some/path/output.csv
}

function absPath(){
    if [[ -d "$1" ]]; then
        cd "$1"
        echo "$(pwd -P)"
    else 
        cd "$(dirname "$1")"
        echo "$(pwd -P)/$(basename "$1")"
    fi
}

if [ -z "$2" ]
then
	usage
fi

if [ -n "$2" ]
then
	listOfRepo="$1"
	outputcsv=$(absPath $2)
	currentPath=$PWD
	
	rm $outputcsv 2> /dev/null
	touch $outputcsv

	echo "Project name", "Hash", "Author", "Date", "Message" >> $outputcsv

	cat $listOfRepo | while read line
	do
		cd $currentPath
		cd "$line/.."
		projectName=$(basename $(git rev-parse --show-toplevel))
		git log --date=iso --pretty=format:"\"$projectName\",\"%H\",\"%an\",\"%ad\",\"%s\"," >> $outputcsv
		echo "" >> $outputcsv
	done
fi
