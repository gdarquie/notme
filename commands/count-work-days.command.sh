#!/bin/bash
. $NOTME_PATH/work/count-work-days.sh

work_days_count=$(count_work_days)
echo "Working day(s) this month: $work_days_count"