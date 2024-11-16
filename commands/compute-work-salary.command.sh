#!/bin/bash
. $NOTME_PATH/work/count-work-days.sh

my_array=(one two three)
printf '%s\n' "${my_array[@]}"
echo "Expected salary"


work_days_count=$(count_work_days)

echo $work_days_count

