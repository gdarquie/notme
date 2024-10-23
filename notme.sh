#!/bin/bash
COMMAND="$1"

if [[ ! $COMMAND || $COMMAND == "create-not" || $COMMAND == "new" || $COMMAND == "n" ]]; then
  echo 'Creating a working not...'
  source $NOTME_PATH"/commands/create-not.sh"

elif [[ $COMMAND == 'create-not-perso' || $COMMAND == "new-perso" || $COMMAND == "p" ]]; then
  echo 'Creating a personal not...'
  source $NOTME_PATH"/commands/create-not.sh" create-not-perso

else
  echo 'No corresponding command has been found.'
fi
