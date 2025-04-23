## Environment setup
## My custom aliases

## General Aliases
alias main='cd /root/holbertonschool-shell/'
alias folder='cd /root/holbertonschool-shell/init_files_variables_and_expansions/'
alias ch='chmod u+x'
alias add='git add .'
alias push='git push'
alias fp='git push --force'
alias root='cd /root/'
alias aliases='emacs ~/.bash_aliases'
alias confaliases='source ~/.bash_aliases'

## permissions table
alias permtable='echo -e "Permissions Quick Reference:\n\n4 = r (read)\n2 = w (write)\n1 = x (execut\
e)\n\n7 = rwx (4+2+1)\n6 = rw- (4+2+0)\n5 = r-x (4+0+1)\n4 = r-- (4+0+0)\n3 = -wx (0+2+1)\n2 = -w- (\
0+2+0)\n1 = --x (0+0+1)\n0 = --- (0+0+0)"'

## io Table
alias io='echo -e "FILE DISPLAY & MANIPULATION:\n\nDisplay file content:\n- cat file          # Display entire file\n- head -n N file    # Display first N lines\n- tail -n N file    # Display last N lines\n- head -3 file | tail -1  # Display specific line (3rd line)\n\nFile Operations:\n- > filename        # Create/overwrite file\n- >> filename       # Append to file\n- command > file    # Redirect output to file\n- command >> file   # Append output to file\n- command 2> file   # Redirect errors to file\n- command &> file   # Redirect both output and errors\n- command1 | command2  # Pipe output of command1 to command2"'

## Filter table
alias filter='echo -e "TEXT PROCESSING & FILTERING:\n\nText Manipulation:\n- tr set1 set2      # Replace characters in set1 with corresponding chars in set2\n- tr -d chars      # Delete specified characters\n- rev              # Reverse lines of text\n- sort             # Sort lines alphabetically\n- sort -r          # Sort in reverse\n- sort -n          # Sort numerically\n- sort -u          # Sort and remove duplicates\n- uniq             # Remove adjacent duplicate lines\n- uniq -u          # Only show lines that appear once\n- uniq -c          # Count occurrences of lines\n\nPattern Matching:\n- grep pattern file  # Find pattern in file\n- grep -v pattern    # Invert match (lines NOT containing pattern)\n- grep -A N pattern  # Show N lines after match\n- grep -B N pattern  # Show N lines before match\n- grep -C N pattern  # Show N lines before and after match\n- grep -i pattern    # Case insensitive search\n- grep -l pattern    # Only show filenames with matches\n- grep -c pattern    # Count matching lines"'

## directory listing navigation
alias dir='echo -e "DIRECTORY OPERATIONS:\n\nDirectory Navigation & Listing:\n- ls -la           # List all files including hidden ones in long format\n- find . -type f    # Find all regular files in current directory and subdirectories\n- find . -type d    # Find all directories\n- find . -type f -name \"*.js\"  # Find files with .js extension\n- find . -type d | wc -l  # Count directories\n\nDirectory Statistics:\n- ls -t | head     # Display 10 newest files\n- find . -type d -not -path \"*/\\.*\" | wc -l  # Count non-hidden directories\n- du -sh *         # Show size of files and directories"'

## Special Characters navigation
alias special='echo -e "SPECIAL CHARACTERS & ESCAPING:\n\nSpecial Characters:\n- * \t\t # Wildcard for any characters\n- ? \t\t # Wildcard for single character\n- [] \t\t # Character class\n- \\\\\\\\ \t\t # Escape character\n- \"\" \t\t # Weak quotes (allow some special chars)\n- '\''\\'''\'' \t # Strong quotes (literal interpretation)\n\nCreating files with special characters:\n- touch \\"file with spaces\\" \t # Create file with spaces\n- touch '\''file'\'' \t\t # Create file with single quotes\n- echo \\"text\\" > \\"difficult\\\\\\\\filename\\" \t # Redirect to file with special chars"'


# Function definitions
function cm() {
    read -p "Commit message: " message
    git commit -m "$message"
}

function gitall() {
    main && add && cm && push
}


# This colors both your prompt and typed commands while preserving prompt content
PS1='\[\033[38;5;208m\]\u@\h:\w\$ \[\033[38;5;183m\]'
trap 'echo -ne "\033[0m"' DEBUG


#!/bin/bash

# Informational ls guide function (does not execute ls)
show_ls_reference() {
  echo -e "\033[1;36m=== LS COMMAND REFERENCE ===\033[0m"
  echo -e "\033[1;33mUSAGE:\033[0m ls [OPTIONS] [FILES]"
  
  echo -e "\n\033[1;33mKEY OPTIONS:\033[0m"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-a" "Show all files (including hidden)"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-F" "Add indicators (*/=>@|)"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-l" "Long format with details"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-h" "Human-readable sizes"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-R" "Recursive listing"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-t" "Sort by time, newest first"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-S" "Sort by size, largest first"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-r" "Reverse sort order"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-d" "List directories, not contents"
  printf "\033[1;32m%-3s\033[0m %-28s\n" "-1" "One file per line"
  
  echo -e "\n\033[1;33mCOMMON COMBINATIONS:\033[0m"
  echo -e "ls -la     → Long format, all files"
  echo -e "ls -lh     → Long format, human sizes"
  echo -e "ls -lt     → Sort by time"
  echo -e "ls -lS     → Sort by size"
  echo -e "ls -ld */  → List directories only"
  
  echo -e "\n\033[1;33mUSEFUL COMBINATIONS WITH OTHER COMMANDS:\033[0m"
  echo -e "ls | grep pattern         → Find files matching pattern"
  echo -e "ls -la | grep ^d          → List directories only"
  echo -e "ls -la | grep ^-          → List regular files only"
  echo -e "ls -l | wc -l             → Count number of files"
  echo -e "ls -lt | head -5          → Show 5 newest files"
  echo -e "ls -lS | head -5          → Show 5 largest files"
  echo -e "ls -la | sort -k5 -n      → Sort files by size"
  echo -e "ls -1 | sort -r           → List files in reverse alphabetical order"
  echo -e "ls -1 | uniq -c           → List with duplicate counts"
  echo -e "ls -la | cut -d' ' -f1    → Extract permissions column"
  echo -e "ls -1 | tr '[:lower:]' '[:upper:]' → Show filenames in uppercase"
  echo -e "ls -1 | rev               → Reverse each filename"
  echo -e "echo \$(ls -1)            → List files in a single line"
  echo -e "find . -type f | cat      → Find and list all files"
  
  echo -e "\n\033[1;33mTIPS:\033[0m"
  echo "• Combine options: ls -lah (long, all files, human sizes)"
  echo "• Directory only: ls -d */ (just folders)"
  echo "• Hidden only: ls -ld .??*"
}

# Add to shell config
alias lsdoc='show_ls_reference'


# Bash shell files reference
alias filestable='echo -e "\n\033[1mShell Initialization Files\033[0m\n\n\033[1mFile\t\t\tWhen Read\t\tPurpose\033[0m\n/etc/profile\t\tAll login shells\tSystem-wide settings\n/etc/bashrc\t\tAll bash shells\tSystem-wide bash functions\n~/.bash_profile\tLogin shells\t\tUser environment settings\n~/.bashrc\t\tInteractive shells\tUser shell settings\n~/.bash_logout\tShell logout\t\tCleanup commands"'

# Bash variables reference
alias variablestable='echo -e "\n\033[1mBash Variables Reference\033[0m\n\n\033[1mVariable\tExpansion\tMeaning\033[0m\n$HOME\t\tHome directory\tCurrent user'"'"'s home path\n$PATH\t\tCommand path\tDirectories searched for commands\n$PS1\t\tPrompt string\tPrimary command prompt\n$?\t\tExit status\tStatus of last command (0=success)\n$!\t\tBackground PID\tPID of last background process\n$0\t\tScript name\tName of current script\n$#\t\tArg count\tNumber of arguments passed\n$@\t\tAll arguments\tAll arguments as separate strings\n$$\t\tCurrent PID\tProcess ID of current shell"'

# Alias command usage guide
alias aliastable='echo -e "\n\033[1mAlias Command Usage\033[0m\n\n\033[1mCommand\t\t\tPurpose\t\t\tExample\033[0m\nalias name=\"cmd\"\tCreate alias\t\talias ll=\"ls -l\"\nalias\t\t\tList all aliases\t\talias\n\\aliasname\t\tDisable once\t\t\\ls\nunalias name\t\tRemove alias\t\tunalias ll\nAdd to ~/.bashrc\tMake permanent\t\tAdd to ~/.bashrc file"'

# Shell expansion reference
alias expansiontable='echo -e "\n\033[1mShell Expansion Types\033[0m\n\n\033[1mType\t\tSyntax\t\tExample\t\t\tResult\033[0m\nPathname\t*,?,[]   \techo *.txt\t\tLists all .txt files\nTilde\t\t~\t\tcd ~/Documents\t\tGoes to Documents dir\nArithmetic\t$((...))\techo $((5+3))\t\t8\nBrace\t\t{a,b,c}\techo file{1..3}.txt\tfile1.txt file2.txt file3.txt\nParameter\t$VAR\t\techo $HOME\t\tShows home directory\nCommand\t\t$(cmd)\t\techo $(date)\t\tShows current date"'


alias aliashelp='~/my_aliases.sh'

alias editaliashelp='emacs ~/my_aliases.sh'