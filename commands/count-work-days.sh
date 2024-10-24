#!/bin/bash

# read -r -d '' WORKING_DAYS_SUMMARY << EOM
# Week | Days   | working days           | count
#  1   | 1-7    | Mo, Tu, We             | 3   
#  2   | 8-15   | Mo, Tu                 | 2 
#  3   | 16-23  | Mo                     | 1
#  4   | 24-31  | Mo                     | 2 
# EOM

RESULT=0

# get the current month = get the current year
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)

# get the path of the current month folder
CURRENT_MONT_FOLDER_PATH=$NOT_PATH/$CURRENT_YEAR/$CURRENT_MONTH

# get all weeks folder in current month, get all files for the month
echo "Week | Days   | working days           | count"

for week in $CURRENT_MONT_FOLDER_PATH/*
do
  if [[ $week ==  "$CURRENT_MONT_FOLDER_PATH/1" || $week == "$CURRENT_MONT_FOLDER_PATH/2" || $week == "$CURRENT_MONT_FOLDER_PATH/3" || $week == "$CURRENT_MONT_FOLDER_PATH/4" || $week == "$CURRENT_MONT_FOLDER_PATH/5" ]]; then
    echo "$CURRENT_YEAR | x - y | X, X ,X | 1"
    # $RESULT = $RESULT+1
  fi
done

# in each files, check if it is a work day or not and if yes add it to the result

echo "$WORKING_DAYS_SUMMARY"
echo "Working day(s) this month: $RESULT"