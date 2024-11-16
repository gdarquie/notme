#!/bin/bash
. $NOTME_PATH/work/count-work-days.sh

work_days_count=$(count_work_days)

commission=$(expr "$AVERAGE_DAILY_RATE_WITH_TAX" \* "$work_days_count" \* $COMMISSION_PERCENT \/ 100)
salary_with_tax=$(expr "$work_days_count" \* "$AVERAGE_DAILY_RATE_WITH_TAX")
salary_without_tax=$(expr "$work_days_count" \* "$AVERAGE_DAILY_RATE_WITHOUT_TAX")
taxes=$(expr "$salary_with_tax" \- "$salary_without_tax")

echo Total after commission: $(expr "$salary_with_tax" \- "$commission")$CURRENCY
echo Total expected: $salary_with_tax$CURRENCY
echo After commission without tax: $(expr "$salary_without_tax" \- "$commission")$CURRENCY
echo Commission: $commission$CURRENCY
echo Taxes: $taxes$CURRENCY