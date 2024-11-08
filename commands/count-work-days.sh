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
  file_content=$(cat "$1")
  not_comment=$(echo "$file_content" | grep -oP "(?<=not:)\{[^}]+\}")
  is_workday=$(echo "$not_comment" | grep -oP "(?<=is_workday: )\w+")

  if [ "$is_workday" = "true" ]; then
    return 0
  else
    return 1
  fi
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
      if check_working_day "$day"; then
        increase_working_days_count
      fi
    done
  fi
done

# in each files, check if it is a work day or not and if yes add it to the result
echo "Working day(s) this month: $working_days"