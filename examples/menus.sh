#!/bin/bash 

# Declare Associative Arrays that contain the menu items.
declare -A main_menu=(
    [1]="Disk Menu" 
    [2]="Hardware Menu" 
    [3]="Config Menu" 
    [4]="Sample Menu 1" 
    [5]="Sample Menu 2"
    [6]="Sample Menu 3"
    [7]="Sample Menu 4"
    [8]="Exit" 
    ["Name"]="Main Menu"
)

declare -A main_opts=(
    [1]="current=\"disk_\""
    [2]="current=\"hw_\""
    [3]="current=\"cfg_\""
    [4]="current=\"sample_\""
    [5]="current=\"sample2_\""
    [6]="current=\"sample3_\""
    [7]="current=\"sample4_\""
    [8]="quitbit=\"0\""
)

declare -A disk_menu=(
    [1]="Contents of /dev" 
    [2]="Block Devices" 
    [3]="LVM Wizard" 
    [4]="Filesystems" 
    [5]="Parted Wizard" 
    [6]="Main Menu" 
    ["Name"]="Disk Menu"
)

declare -A disk_opts=(
    [1]='ls -lha --color=always /dev | less -r'
    [2]='lsblk -lpf | less'
    [3]='echo "Not A Chance. HA!";sleep 10'
    [4]='{ echo -e "********************Filesystem Space Usage********************\n";df -h;echo -e "\n\n********************Filesystem Inode Usage********************\n";df -hi; } | less'
    [5]='echo "Nope, Not here either bub.";sleep 10'
    [6]="current=\"main_\""
)

declare -A hw_menu=(
    [1]="All Hardware" 
    [2]="Network Hardware"
    [3]="Storage Hardware" 
    [4]="Memory Hardware" 
    [5]="CPU Hardware" 
    [6]="Main Menu" 
    ["Name"]="Hardware Menu"
)

declare -A hw_opts=(
    [1]='sudo lshw -short | less'
    [2]='sudo lshw -C Network | less'
    [3]='sudo lshw -C Storage | less'
    [4]='sudo lshw -C Memory | less'
    [5]='sudo lshw -C CPU | less'
    [6]="current=\"main_\""
)

declare -A cfg_menu=(
    [1]="Local Bash Config" 
    [2]="Global Bash Config" 
    [3]="System Bash Config" 
    [4]="Systemd Config" 
    [5]="FS Table" 
    [6]="Main Menu" 
    ["Name"]="Config Menu"
)

declare -A cfg_opts=(
    [1]='sudo lshw -short | less'
    [2]='sudo lshw -C Network | less'
    [3]='sudo lshw -C Storage | less'
    [4]='sudo lshw -C Memory | less'
    [5]='sudo lshw -C CPU | less'
    [6]="current=\"main_\""
)

declare -A sample_menu=(
    [1]="AAAAAAAAAAAAAAAAAAAA" 
    [2]="AAAAAAAAAAAAAAAAAAAA" 
    [3]="AAAAAAAAAAAAAAAAAAAA" 
    [4]="AAAAAAAAAAAAAAAAAAAA" 
    [5]="AAAAAAAAAAAAAAAAAAAA" 
    [6]="AAAAAAAAAAAAAAAAAAAA" 
    ["Name"]="Sample Menu 1"
)

declare -A sample_opts=(
    [1]='sudo lshw -short | less'
    [2]='sudo lshw -C Network | less'
    [3]='sudo lshw -C Storage | less'
    [4]='sudo lshw -C Memory | less'
    [5]='sudo lshw -C CPU | less'
    [6]="current=\"main_\""
)

declare -A sample2_menu=(
    [1]="Option 1" 
    [2]="Option 2" 
    [3]="Option 3" 
    [4]="Option 4" 
    [5]="Option 5" 
    [6]="Main Menu" 
    ["Name"]="Sample Menu 2"
)

declare -A sample2_opts=(
    [1]='sudo lshw -short | less'
    [2]='sudo lshw -C Network | less'
    [3]='sudo lshw -C Storage | less'
    [4]='sudo lshw -C Memory | less'
    [5]='sudo lshw -C CPU | less'
    [6]="current=\"main_\""
)

declare -A sample3_menu=(
    [1]="AAAAAAAAAAAAAAAAAAAA" 
    [2]="AAAAAAAAAAAAAAAAAAAA" 
    [3]="AAAAAAAAAAAAAAAAAAAA" 
    [4]="AAAAAAAAAAAAAAAAAAAA" 
    [5]="AAAAAAAAAAAAAAAAAAAA" 
    [6]="AAAAAAAAAAAAAAAAAAAA" 
    [7]="AAAAAAAAAAAAAAAAAAAA" 
    [8]="AAAAAAAAAAAAAAAAAAAA" 
    [9]="AAAAAAAAAAAAAAAAAAAA" 
    [10]="AAAAAAAAAAAAAAAAAAAA" 
    [11]="AAAAAAAAAAAAAAAAAAAA" 
    [12]="AAAAAAAAAAAAAAAAAAAA" 
    [13]="AAAAAAAAAAAAAAAAAAAA" 
    [14]="AAAAAAAAAAAAAAAAAAAA" 
    [15]="AAAAAAAAAAAAAAAAAAAA" 
    [16]="AAAAAAAAAAAAAAAAAAAA" 
    [17]="AAAAAAAAAAAAAAAAAAAA" 
    [18]="AAAAAAAAAAAAAAAAAAAA" 
    [19]="AAAAAAAAAAAAAAAAAAAA" 
    [20]="Main Menu" 
    ["Name"]="Sample Menu 3"
)

declare -A sample3_opts=(
    [1]='sudo lshw -short | less'
    [2]='sudo lshw -C Network | less'
    [3]='sudo lshw -C Storage | less'
    [4]='sudo lshw -C Memory | less'
    [5]='sudo lshw -C CPU | less'
    [6]="current=\"main_\""
    [7]="current=\"main_\""
    [8]="current=\"main_\""
    [9]="current=\"main_\""
    [10]="current=\"main_\""
    [11]="current=\"main_\""
    [12]="current=\"main_\""
    [13]="current=\"main_\""
    [14]="current=\"main_\""
    [15]="current=\"main_\""
    [16]="current=\"main_\""
    [17]="current=\"main_\""
    [18]="current=\"main_\""
    [19]="current=\"main_\""
    [20]="current=\"main_\""
)

declare -A sample4_menu=(
    [1]="AAAAAAAAAAAAAAAAAAAA" 
    [2]="AAAAAAAAAAAAAAAAAAAA" 
    [3]="AAAAAAAAAAAAAAAAAAAA" 
    [4]="AAAAAAAAAAAAAAAAAAAA" 
    [5]="AAAAAAAAAAAAAAAAAAAA" 
    [6]="AAAAAAAAAAAAAAAAAAAA" 
    [7]="AAAAAAAAAAAAAAAAAAAA" 
    [8]="AAAAAAAAAAAAAAAAAAAA" 
    [9]="AAAAAAAAAAAAAAAAAAAA" 
    [10]="AAAAAAAAAAAAAAAAAAAA" 
    [11]="AAAAAAAAAAAAAAAAAAAA" 
    [12]="AAAAAAAAAAAAAAAAAAAA" 
    [13]="AAAAAAAAAAAAAAAAAAAA" 
    [14]="AAAAAAAAAAAAAAAAAAAA" 
    [15]="AAAAAAAAAAAAAAAAAAAA" 
    [16]="AAAAAAAAAAAAAAAAAAAA" 
    [17]="AAAAAAAAAAAAAAAAAAAA" 
    [18]="AAAAAAAAAAAAAAAAAAAA" 
    [19]="AAAAAAAAAAAAAAAAAAAA" 
    ["Name"]="Sample Menu 4"
)

declare -A sample4_opts=(
    [1]="current=\"main_\""
    [2]="current=\"main_\""
    [3]="current=\"main_\""
    [4]="current=\"main_\""
    [5]="current=\"main_\""
    [6]="current=\"main_\""
    [7]="current=\"main_\""
    [8]="current=\"main_\""
    [9]="current=\"main_\""
    [10]="current=\"main_\""
    [11]="current=\"main_\""
    [12]="current=\"main_\""
    [13]="current=\"main_\""
    [14]="current=\"main_\""
    [15]="current=\"main_\""
    [16]="current=\"main_\""
    [17]="current=\"main_\""
    [18]="current=\"main_\""
    [19]="current=\"main_\""
)