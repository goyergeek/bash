# WTC ITSC-1458: Linux Installation and Configuration BASH scripts
**This is a repo for the ITSC-1458 Linux Installation and Configuration classes.**
## How to clone this repo and initialize for use
* On any Linux VM Instance, open a terminal and navigate to your home folder.
* Create the following folder within the home folder: **_~/scripts_**
* Navigate to **_~/scripts_** and run the command: **_user@server:~/scripts$ git clone https://github.com/goyergeek/bash.git_**
* Repo should now be cloned, navigate to **_~/scripts/bash_**, and make sure all files are present.
* run **_chmod ug+x ~/scripts/bash/init.sh_**
* run **_./~/scripts/bash/init.sh_**
* validate that all .sh files in **_~/scripts/bash/examples_** now have executable flag set in permissions.
* validate that test files have been generated in **_~/scripts/bash/files/01-03_** (100 each in files/01 files/02, and 50 in files/03)

## Shell script files and descriptions
* **arrays_and_loops.sh**: Examples of indexed and associative arrays, while for and until loops.
  * Running this script will output examples of loops and arrays to the screen.
