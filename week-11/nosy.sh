#!/bin/bash

#█████████████████████████████████████████████████████████████ Color Codes ███
normorange="\033[0;33m"; 
lightGreen="\033[1;32m"; 
lightCyan="\033[1;36m"; 
lightRed="\033[1;31m";
NC="\033[0m";

#████████████████████████████████████████████████████████ Function - PRINT ███
function printo {
    if [ -z "$2" ]; then
        echo -e "$1"
    elif [ "$2" == "S" ]; then
        echo -e "${lightGreen}$1${NC}"
    elif [ "$2" == "F" ]; then
        echo -e "${lightRed}$1${NC}"
    elif [ "$2" == "H1" ]; then
        echo -e "${lightCyan}$1${NC}"
    elif [ "$2" == "Q" ]; then
        echo -e "${normorange}$1${NC}"
    fi
}

#███████████████████████████████████████████████████████████████ First Try ███
# # Ask the user their first name
# echo -n "Please enter your first name: "
# read -e first_name
# # Ask the user their middle name
# echo -n "Please enter your middle name: ";
# read -e middle_name
# # Ask the user their last name
# echo -n "Please enter your last name: ";
# read -e last_name

# # greet user by their first name
# echo "$first_name, Welcome to Chamlplain Week 11 nosy bash script."

#██████████████████████████████████████████████████████████████ Second Try ███
echo
# Ask the user their first name
printo "█████████████████████████████████████████████████████████████ NOSY ███" H1
printo "Please enter your full name." Q
printo "NAME FORMAT ==> [first last middle]" Q
echo -n " [ENTER]: "
read -a full_name

# greet user by their first name
printo "${full_name[0]}, Welcome to Chamlplain Week 11 nosy bash script." S

# Ask the user login name
printo "What is your login name: " Q
echo -n " [ENTER]: "
read login_name

# check if this name is found
if grep -q "^$login_name:" /etc/passwd; then
  # get this users details from the /etc/passwd file
  IFS=':' read -r -a user_details <<< $(grep "^$login_name:" /etc/passwd)
  # display the user ID
  printo "Your user ID is: ${user_details[2]}" S
  # display the user home directory path
  printo "Your home directory is: ${user_details[5]}" S
  # display user the processes running
  printo "██████████████████████████████████████████████████████████████████████" H1
  printo "█ ${full_name[0]} currently have these running processes" H1
  printo "██████████████████████████████████████████████████████████████████████" H1
  ps r -u $login_name
  printo "██████████████████████████████████████████████████████████████████████" H1
  # display the day of the week and the time
  date +"The day of the week is %A and the current time is %r."
else
  printo "This user name was not found in /etc/passwd" F
fi
printo "██████████████████████████████████████████████████████████████ BYE ███" H1
echo

