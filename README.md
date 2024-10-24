# NotMe

NotMe is a CLI for creating notes. You can create a note for work or a personnal note and it will help to manage work notes.

## Install

Clone this projet. There is nothing else to do.

```
git@github.com:gdarquie/notme.git
```

Add in bash an env var NOT_PATH with the pwd of your not project.
Add another bash env var NOTME_PATH with the pwd of you notme project.

## Create a note

You can create a new note with the commande

```
notme
```

It will create a Not note for the current day with a work template.

It is possible to create a new Not note with a personnal template: it won't be considered as a week day and it will miss the organisation part content.

```
notme p
```

## Counting working days of the month

In progress.

```
notme w
```