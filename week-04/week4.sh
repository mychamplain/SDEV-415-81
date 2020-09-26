#!/bin/bash
#/-------------------------------------------------------------------------------------------------------
#
#	@version		1.0.0
#	@build			28th Sept, 2020
#	@package		SDEV-415-81: Linux/ Unix Programming I - Fall 2020 (2020FA)
#	@sub-package		Week 4: Assignment - Directory Structure
#	@author		Llewellyn van der Merwe <https://github.com/Llewellynvdm>
#	@copyright		Copyright (C) 2020. All Rights Reserved
#	@license		GNU/GPL Version 2 or later - http://www.gnu.org/licenses/gpl-2.0.html
#
#/--------------------------------------------------------------------------------------------------------


# 1. Create a directory structure for the work you do in this class. The directory structure should
#    include a top-level directory (located in your home directory) named “Linux Programming I”.
#    You then need to create sub-directories inside this directory for each week.
#    (week1, week2, all the way up to week15).
#    Lastly, create Assignment directories in each “weekN” directory.
#    You will need to use the mkdir and cd commands to do this.
#    You should also use the ls command to demonstrate the creation of the directory structure.

echo "Create Working Directories"

DIR="/home/llewellyn/Linux Programming I"
if [ ! -d "$DIR" ] 
    then
    mkdir -p "$DIR"
fi
# now create the first 7 weeks directories
for w in {1..7};
do
  WEEK="${DIR}/1_Week${w}_1"
  echo "Creating $WEEK"
  if [ ! -d "$WEEK" ] 
    then
    mkdir -p "$WEEK"
  fi
done
# now create the last 7/8 weeks directories
for w in {8..15};
do
  WEEK="${DIR}/2_Week${w}_1"
  echo "Creating $WEEK"
  if [ ! -d "${DIR}/2_Week${w}_1" ] 
    then
    mkdir -p "${DIR}/2_Week${w}_1"
  fi
done

# 2. Perform the following

echo "Change your prompt variable to display the current working directory (pwd)"
echo "" >> /home/llewellyn/.bashrc
echo "# Set SIMPLE (pwd) prompt" >> /home/llewellyn/.bashrc
echo "PS1='\${PWD##*/}/ '" >> /home/llewellyn/.bashrc

echo "Set the history to be 100 commands"
echo "" >> /home/llewellyn/.profile
echo "# Keep only 100 History Commands" >> /home/llewellyn/.profile
echo "export HISTSIZE=100" >> /home/llewellyn/.profile

echo "Change to working directory ${PWD}"
cd "${PWD}"

echo "Set an alias to allow typing h to list the history of commands."
echo "" >> /home/llewellyn/.bash_aliases
echo "# To list history of commands" >> /home/llewellyn/.bash_aliases
echo "alias h='!!'" >> /home/llewellyn/.bash_aliases

echo "Set an alias for listlong to be ls –latr."
echo "" >> /home/llewellyn/.bash_aliases
echo "# To list long detials" >> /home/llewellyn/.bash_aliases
echo "alias listlong='ls -latr'" >> /home/llewellyn/.bash_aliases

echo "Set an alias named dir to be ls -aF | more"
echo "" >> /home/llewellyn/.bash_aliases
echo "# To show dir listing" >> /home/llewellyn/.bash_aliases
echo "alias dir='ls -aF | more'" >> /home/llewellyn/.bash_aliases

echo "Set an alias named del to be \"rm -i\"."
echo "" >> /home/llewellyn/.bash_aliases
echo "# To do a stupid prompt before every removal" >> /home/llewellyn/.bash_aliases
echo "alias del='rm -i'" >> /home/llewellyn/.bash_aliases

# 3. TERM and HOME

echo "Display the values of your TERM and HOME environment variables to the screen."
echo "TERM = ${TERM}"
echo "HOME = ${HOME}"

# 4. Hit the CTRL-D key combination

echo "When the IGNOREEOF=4 the means pressing CTRL-D four times will only close my session."
echo "" >> /home/llewellyn/.profile
echo "# Prevent closing a session inadvertently" >> /home/llewellyn/.profile
echo "export IGNOREEOF=4" >> /home/llewellyn/.profile

# 5. MAN page

echo "Write bash man page to ${PWD}/bash.txt"
man bash > "${PWD}/bash.txt"

echo "Write csh man page to ${PWD}/csh.txt"
man csh > "${PWD}/csh.txt"

echo "Write korn/ksh man page to ${PWD}/korn.txt"
man ksh > "${PWD}/korn.txt"

# 6. number of files in /usr/bin

echo "list the number of files in /usr/local/bin"
ls -1 /usr/bin | wc -l > ~/ls_output
echo "~/ls_output is in the current user directory"
echo "On my PC there is 1385 files in this directory"

# 7. Display the current number of processes
#    running on your system using any number
#    of commands and a pipe.  I want the number,
#    not just a list of processes.

number=$(ps aux | wc -l)
echo "There is ${number} prossess running right now."

# 8. Explain the difference between “>” and “>>”
#    when using redirection.   Also, what does
#    the “!” command do.
#    Give me an example and its output.

echo "My whole script demostrates the >> and >"
echo "The >> adds a new line to a file"
echo "The > replace the whole file with the new given values"

