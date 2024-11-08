#!/bin/bash
let working_days=0

check_week_path() {
  WEEK_NUMBERS=(1 2 3 4 5)
  for accepted_week_number in ${WEEK_NUMBERS[@]}; do
    if [[ $1 == "$CURRENT_MONTH_FOLDER_PATH/$accepted_week_number" ]]; then
      return 0;
    fi
  done

  return 1
}

check_working_day() {
  # todo: check in the file if it is a working day or not
  # add logic to check in comment if it is a working day
  # first we need to parse the content of the day
  # then I need to get the not in the beginning
  # then I need to get the not object
  # then I need to check if it is a work day
  return 0
}

increase_working_days_count() {
  ((working_days++))
}

# get the current month = get the current year
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)

# get the path of the current month folder
CURRENT_MONTH_FOLDER_PATH=$NOT_PATH/$CURRENT_YEAR/$CURRENT_MONTH


is_week_path=1
for week in $CURRENT_MONTH_FOLDER_PATH/*
do
  if [[ $(check_week_path "$week") -eq 0 ]]; then
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
echo "Working day(s) this month: $working_days"