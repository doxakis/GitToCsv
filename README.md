# GitToCsv
Find all git repositories on your local machine and produce a csv file with all git log information.

Open the csv file with Excel. Apply filter. Start analyzing the provided information.

The column are : Project name, Hash, Author, Date, Message.

# Use cases
- Sort by Author and compute date difference between commits to build a knowledge base and better estimate similar job in the future.
- Sort by Project name and compute the subtotal of all date difference to estimate the total amount of work done on each project. (It is maybe useful if you jump on lot of project.)

# How to run
- Move to the parent folder containing all your repositories.
- You may need to change the value 5 to a greater value (it indicates the max depth for searching git folder)
- Run these scripts: (or download the 2 scripts from the repository)
```
curl https://raw.githubusercontent.com/doxakis/GitToCsv/master/findAllGitFolders.sh | bash -s . gitfolders.txt 5
curl https://raw.githubusercontent.com/doxakis/GitToCsv/master/gitToCsv.sh | bash -s gitfolders.txt result.csv
```
## Notes
It will overwrite the gitfolders.txt file.

It will search for a max depth of 5 from "." ("." means the current folder. You can specify relative or absolute path also.)

You can open the gitfolders.txt file and remove any repository path you don't want to get the log.

The second script will produce a csv file based on git log command.

It will overwrite the result.csv file.

# Copyright and license
Code released under the MIT license.
