#!/bin/bash

# COMPOSE FILE NAME AND PATH
if [ "${NOT_PATH}" ]; then
  NOT_PATH="${NOT_PATH}"
else
  NOT_PATH=`pwd`
fi

COMMAND=$1

YEAR=$(date +%Y)
MONTH=$(date +%m)
TODAY_WEEK=$(date +%W)
TODAY_WEEK_WITHOUT_ZERO="${TODAY_WEEK#0}"
START_OF_MONTH_WEEK=$(date -d $YEAR"-"$MONTH"-01" +%W)
WEEK_NUMBER=`expr $TODAY_WEEK_WITHOUT_ZERO - $START_OF_MONTH_WEEK + 1`
DAY_NUMBER=$(date +%d)
COMPLETE_FOLDER_PATH=$NOT_PATH/$YEAR/$MONTH/$WEEK_NUMBER
COMPLETE_FILE_PATH=$COMPLETE_FOLDER_PATH/$DAY_NUMBER.md
IS_WORKDAY=true

if [[ $COMMAND == 'create-not-perso' ]]; then
  IS_WORKDAY=false
fi

# Content
if [[ $IS_WORKDAY == false ]]; then
  ORGANISATION_CONTENT=""
else
  ORGANISATION_CONTENT="
## Organisation

- hier:
- aujourd'hui:
"
fi

# CREATE FOLDER(S) & FILE
if [[ ! -f "$COMPLETE_FILE_PATH" ]]; then

  mkdir -p $COMPLETE_FOLDER_PATH
  touch $COMPLETE_FILE_PATH

  # ADD CONTENT
  TODAY=$(date -d $YEAR"-"$MONTH"-"$DAY_NUMBER +"%A %d %B %Y" | sed 's/^./\U&/')
  UUID=$(uuidgen)
  CURRENT_TIME=$(date +"%H:%M")

  cat <<EOT > $COMPLETE_FILE_PATH

[//]: # (not:{uid: '$UUID', is_workday: $IS_WORKDAY, created_at: $(date)})

# $TODAY

Créé à $CURRENT_TIME. Uuid: $UUID
$ORGANISATION_CONTENT
EOT

  echo "not has been created."
else
  echo "This not already exists. Nothing has been done."
fi