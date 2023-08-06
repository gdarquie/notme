#!/bin/bash

echo "Welcome to Not Me CLI!"

read -p "What command would you like to run? " command

if [[ $command == "create-not" || $command == "not" || $command == "new" ]]; then
  source $NOTME_PATH"/commands/create-not"
fi
