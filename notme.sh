#!/bin/bash
COMMAND="$1"
CREATE_NOT_COMMAND_PATH=$NOTME_PATH"/commands/create-not.command.sh"

if [[ ! $COMMAND || $COMMAND == "create-not" || $COMMAND == "new" || $COMMAND == "n" ]]; then
  echo 'Creating a working not...'
  source $CREATE_NOT_COMMAND_PATH

elif [[ $COMMAND == 'create-not-perso' || $COMMAND == "new-perso" || $COMMAND == "p" ]]; then
  echo 'Creating a personal not...'
  source $CREATE_NOT_COMMAND_PATH

elif [[ $COMMAND == 'count-work-days' || $COMMAND == 'w' ]]; then
  echo 'Counting work days...'
  source $NOTME_PATH"/commands/count-work-days.command.sh"

elif [[ $COMMAND == 'compute-work-salary' || $COMMAND == 'ws' ]]; then
  echo 'Counting work days...'
  source $NOTME_PATH"/commands/compute-work-salary.command.sh"

else
  echo 'No corresponding command has been found.'
fi
