#!/bin/sh
# Command Line Tool so I don't repeat myself while I'm publishing new stuff.
cd $(dirname $0)

# FUNCTIONS
clean(){
    echo "Cleaning up $PWD at $(date)" >> /tmp/jekyll.blog
    jekyll build 2>> /tmp/jekyll.blog >> /tmp/jekyll.blog
}

save(){
    echo "What modifications have you done? [ENTER to finish, Ctrl+C to abort]"
    read MSG

    clean
    git add .
    git commit -m "$MSG"
}

revert(){
    git stash
}

publish(){
    clean
    git push -u origin master
}

local(){
    jekyll serve
}

modifications(){
    clean
	RESP=$(git status -s)
	if [ ! "$RESP" = "" ]; then
		echo "Changes on your current work."
		git status -s
	else
		echo "No changes on your current work."
	fi
}

case $1 in
  "save") save ;;
  "revert") revert ;;
  "publish") publish ;;
  "local" ) local ;;
  "modif"|"modifications") modifications ;;
  *)
    echo "Bad syntax."
    echo "Usage $0 <OPTS>"
    echo
    echo "OPTS:"
    echo " * save"
    echo " * revert"
    echo " * publish"
    echo " * local"
    echo " * modif|modifications"
 ;;
esac