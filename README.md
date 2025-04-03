# WTC ITSC-1458: Linux Installation and Configuration BASH scripts
**This is a repo of BASH shell scripts for ITSC-1458 Linux Installation and Configuration classes.**
## How to clone this repo
* On any Linux VM Instance, open a terminal and navigate to your home folder.
* Create the following folder within the home folder: **_/scripts_**
* Navigate to **_~/scripts_** and run the command **_git clone https://github.com/goyergeek/bash_**

* filegen.sh: Generates a folder structure and 1,000 files in the current users home directory.
  * Creates folders **_/files_**, **_/files2_**, **_/templogs_**
  * Generates 1,000 files in /files folder with following name format: **_[mmddYYY]\_file#\_[file number]_**
  * Moves files in **_/files_** to **_/files2_** and redirects stdout and stderr to files in **_/templogs_**
  * Attempts to copy a file that does not exist to generate errors for stderr redirects
