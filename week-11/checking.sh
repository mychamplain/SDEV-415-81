#!/bin/bash



#█████████████████████████████████████████████████████████████ Color Codes ███
normorange="\033[0;33m"; 
normyellow="\033[1;33m"; 
normnormcyan="\033[0;36m";
lightRed="\033[1;31m";
NC="\033[0m";

#████████████████████████████████████████████████████████ Function - PRINT ███
function printo {
    if [ -z "$2" ]; then
        echo -e "$1"
    elif [ "$2" == "S" ]; then
        echo -e "${normyellow}$1${NC}"
    elif [ "$2" == "F" ]; then
        echo -e "${lightRed}$1${NC}"
    elif [ "$2" == "H1" ]; then
        echo -e "${normnormcyan}$1${NC}"
    elif [ "$2" == "Q" ]; then
        echo -e "${normorange}$1${NC}"
    fi
}

#███████████████████████████████████████████████████████████ Error notice ███
function showerror() {
	printo "███████████████████████████████████████████████████████████ ERROR ███" F
	printo "█                                                                   █" F
	printo "█   Invalid argument, please your username                          █" F
	printo "█                                                                   █" F
	printo "█████████████████████████████████████████████████████████████████████" F
}
# check that at least one argument is passed
if [ $# -eq 1 ] 
then
	# add the username
	login_name="$1"
else
	showerror
	exit 1
fi

#██████████████████████████████████████████████████████████████ the script ███
echo
# Ask the user login name
printo "█████████████████████████████████████████████████████████ CHECKING ███" H1
# make sure we get an input value
while [[ -z $login_name ]]
do
  printo "What is your login name: " Q
  echo -n " [ENTER]: "
  read login_name
done 

# check if this name is found
if grep -q "^$login_name:" /etc/passwd; then

  printo "Found \"$login_name\" in the /etc/passwd file." S
else
  printo "No such user on our system" F
fi
printo "██████████████████████████████████████████████████████████████ BYE ███" H1
echo

