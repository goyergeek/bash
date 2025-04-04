# WTC ITSC-1458: Linux Installation and Configuration BASH scripts
**This is a repo for the ITSC-1458 Linux Installation and Configuration classes.**
## How to clone this repo and initialize for use
* On any Linux VM Instance, open a terminal and navigate to your home folder.
* Create the following folder within the home folder: **_~/scripts_**
* Navigate to **_~/scripts_** and run the command: **_user@server:~/scripts$ git clone https://github.com/goyergeek/bash.git_**
* Repo should now be cloned, navigate to **_~/scripts/bash_**, and make sure all files are present.
* run **_chmod ug+x ~/scripts/bash/init.sh_**
* run **_~/scripts/bash/init.sh_**
* validate that all .sh files in **_~/scripts/bash_** now have executable flag set in permissions.

## Shell script files and descriptions
* **filegen.sh**: Generates a folder structure and 1,000 files in the current users home directory.
  * Creates folders **_/files_**, **_/files2_**, **_/templogs_**
  * Generates 1,000 files in /files folder with following name format: **_[mmddYYY]\_file#\_[file number]_**
  * Moves files in **_/files_** to **_/files2_** and redirects stdout and stderr to files in **_/templogs_**
  * Attempts to copy a file that does not exist to generate errors for stderr redirects
