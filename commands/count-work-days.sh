#!/bin/bash

# read -r -d '' WORKING_DAYS_SUMMARY << EOM
# Week | Days   | working days           | count
#  1   | 1-7    | Mo, Tu, We             | 3   
#  2   | 8-15   | Mo, Tu                 | 2 
#  3   | 16-23  | Mo                     | 1
#  4   | 24-31  | Mo                     | 2 
# EOM

let result=0

check_week_path() {
  # WEEK_NUMBERS=(1 2 3 4 5)
  # echo "here?"
  # for accepted_week_number in ${WEEK_NUMBERS[@]}; do

  #   echo "week = $CURRENT_MONTH_FOLDER_PATH/$accepted_week_number"

  #   if [[ $week=="$CURRENT_MONTH_FOLDER_PATH/$accepted_week_number" ]]; then
  #     # return 1
  #     echo "$CURRENT_MONTH_FOLDER_PATH/$accepted_week_number"
  #   fi
  # done
  return 1
  # return $week ==  "$CURRENT_MONTH_FOLDER_PATH/1" || $week == "$CURRENT_MONTH_FOLDER_PATH/2" || $week == "$CURRENT_MONTH_FOLDER_PATH/3" || $week == "$CURRENT_MONTH_FOLDER_PATH/4" || $week == "$CURRENT_MONTH_FOLDER_PATH/5"
}

check_working_day() {
  # add logic to check in comment if it is a working day
  # first we need to parse the content of the day
  # then I need to get the not in the beginning
  # then I need to get the not object
  # then I need to check if it is a work day
  return 0
}

increase_working_days_count() {
  ((result++))
}

# get the current month = get the current year
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)

# get the path of the current month folder
CURRENT_MONTH_FOLDER_PATH=$NOT_PATH/$CURRENT_YEAR/$CURRENT_MONTH

# get all weeks folder in current month, get all files for the month
# echo "Week | Days   | working days           | count"

is_week_path=1
for week in $CURRENT_MONTH_FOLDER_PATH/*
do
  is_week_path=$(check_week_path "$week")
  echo "is week is ="$is_week_path
  if [[ $is_week_path -eq 0 ]]; then
    # echo "$CURRENT_YEAR | x - y | X, X ,X | 1"
    # echo 'week ='$week

    for day in $week/*
    do
      # echo "day  ="$day
      if check_working_day "$week"; then
        increase_working_days_count
      fi
    done
  fi
done

# in each files, check if it is a work day or not and if yes add it to the result

echo "$WORKING_DAYS_SUMMARY"
echo "Working day(s) this month: $result"