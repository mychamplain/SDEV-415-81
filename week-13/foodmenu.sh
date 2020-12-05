#!/bin/bash
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#  Champlain College SDEV-415-81
#
#  Linux/Unix Programming Week 13: Loops and Function  - (2020/12/06)
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  The Program will display a menu that a user can select an option from and get a little note ;)
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Write a script that will do the following:
#      Provide a comment section at the top of the script,
#      with your name, the date, and the purpose of the program.
#
#      Use the select loop to produce a menu of foods.
#      Produce output to resemble the following:
#        1) Steak and potatoes
#        2) Fish and chips
#        3) Soup and salad
#        --------------------------
#        Please make a selection. 1
#          Stick to your ribs
#          Watch your cholesterol.
#          Enjoy your meal.
#        --------------------------
#        Please make a selection. 2
#          British are coming!
#          Enjoy your meal.
#        --------------------------
#        Please make a selection. 3
#          Health foods…
#          Dieting is so boring.
#          Enjoy your meal.
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Written by Llewellyn van der Merwe <llewellyn.vandermerw@mymail.champlain.edu>, December 2020
#  Copyright (C) 2020. All Rights Reserved
#  License GNU/GPL Version 2 or later - http://www.gnu.org/licenses/gpl-2.0.html
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# basic main function ;)
function main() {
  # some house cleaning
  PS3_old=$PS3
  # some defaults
  export PS3="Please make a selection: "
  # Start our little Menu
  select menu in \
      'Steak and potatoes' \
      'Fish and chips' \
      'Soup and salad' \
      'Done'
  do
    case $REPLY in
        1 ) ribsNotice;;
        2 ) britishNotice;;
        3 ) healthNotice;;
        4 )
            # final greeting
            echo
            echo "Goodbye! ${USER^}"
            echo
            exit 0;;
        * )
            echo "Error select option 1..4";;
    esac
    # we can add a normal break here if the loop must just run once
    # break;
  done
  # restore the default
  export PS3=$PS3_old
}

# Welcome...
function welcomeNotice() {
  # get the current date
  current_date=$(date +"%A %-d %b %Y");
  # set at the top of the menu (script)
  echo "My name is Llewellyn"
  echo "Today is $current_date"
  echo "Welcome to the Café Prestige"
  echo
  echo "Here is our menu for the day."
}

# Just to show the menu again (not ideal)
function reminderNotice(){
  echo
  echo "Would you like another?"
  echo "1) Steak and potatoes"
  echo "2) Fish and chips"
  echo "3) Soup and salad"
  echo "4) Done"
}

# Show the welcome notice
welcomeNotice

# The menu notice for
# Steak and potatoes
function ribsNotice() {
  echo
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "Stick to your ribs"
  echo "Watch your cholesterol."
  echo "Enjoy your meal."
  echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  reminderNotice
}
# The menu notice for
# Fish and chips
function britishNotice() {
  echo
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "British are coming!"
  echo "Enjoy your meal."
  echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  reminderNotice
}
# The menu notice for
# Soup and salad
function healthNotice() {
  echo
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  echo "Health foods…"
  echo "Dieting is so boring."
  echo "Enjoy your meal."
  echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  reminderNotice
}

# run main.. lol
main
