#!/bin/bash
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#  Champlain College SDEV-415-81
#
#  Linux/Unix Programming Week 13: Loops and Function  - (2020/12/06)
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Write a program called mchecker to check for new mail and
#  write a message to the screen if new mail has arrived.
#    The program will get the size of the mail spool file for the user.
#    (The spool files are found in /var/spool/mail/$USER on Linux,
#    Use the find command if you cannot locate the file.)
#    The script will execute in a continuous loop, once every 30 seconds.
#    Each time the loop executes, it will compare the size of the mail spool
#    file with its size from the previous loop. If the new size is greater than
#    the old size, a message will be printed on your screen,
#    saying “Username, You have new mail”.
#         The size of a file can be found by looking
#         at the output from ls –l, wc –c or from the find command.
#
#  Note: To test this, you can simply edit the spool file to add a new entry.
#    (echo "More data" >> /var/spool/mail/$USER)
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#
#  Written by Llewellyn van der Merwe <llewellyn.vandermerw@mymail.champlain.edu>, December 2020
#  Copyright (C) 2020. All Rights Reserved
#  License GNU/GPL Version 2 or later - http://www.gnu.org/licenses/gpl-2.0.html
#
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# path to the spool mail file
FILENAME=/var/spool/mail/$USER
# check if this file exist
if [ ! -f $FILENAME ]; then
  # give console error
  echo "The mail spool file for $USER does not exist in [$FILENAME]."
  # break out here
  exit 1
fi
# the size tracker
LASTFILESIZE=0
# start the continuous loop
while true; do
  FILESIZE=$(stat -c%s "$FILENAME")
  if [[ $FILESIZE -gt $LASTFILESIZE ]]; then
    # only give message if LASTFILESIZE is greater than 0
    if [[ $LASTFILESIZE -gt 0 ]]; then
      # give notice to console
      echo "${USER^}, You have new mail"
    fi
    # set the new size
    LASTFILESIZE=$FILESIZE
  fi
  # run this check again every
  # 30 seconds
  sleep 30s
done
