#!/bin/bash
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#  Champlain College SDEV-415-81
#
#  Linux/Unix Programming Week 13: Loops and Function  - (2020/12/06)
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Write a script named add that takes two command line arguments and displays as output their sum.
#  The script is required to contain a function named add that takes
#  these two arguments and returns their sum.
#
#  Your script should also verify that the user entered two and only
#  two arguments at the command line.
#
#  If the user does not execute the program correctly,
#  an error should be display describing the correct usage.
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Written by Llewellyn van der Merwe <llewellyn.vandermerw@mymail.champlain.edu>, December 2020
#  Copyright (C) 2020. All Rights Reserved
#  License GNU/GPL Version 2 or later - http://www.gnu.org/licenses/gpl-2.0.html
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# addition function
function add() {
  # do the sum ;)
  num=$(echo $1 + $2 | bc)
  # we return the sum
  echo "The sum is $num"
}

# help function
function show_help {
  echo "================================================================"
  echo $1
  cat << EOF
================================================================
Usage: ${0##*/:-} [OPTION...]

Provide two numbers as arguments

Example run:
  ${0##*/:-} 5 8
The sum is 13
===============================================================
EOF
  exit 1
}

# check enough arguments were passed
if [ $# -eq 2 ]; then
  # check input is numbers
  regex='^[0-9]+([\.][0-9]+)?$'
  if [[ $1 =~ $regex && $2 =~ $regex ]]; then
    # run main function
    add "$1" "$2"
  else
    show_help "Error: Not a number"
  fi
elif [ $# -gt 2 ]; then
  show_help "Error: Too many arguments"
else
  show_help "Error: Not enough arguments"
fi
