#!/bin/bash
# This is all the things that are most irritating when they are wrong and are
# most resistant to automation. I don't even want to look at the screen until
# these fixes are applied. They must go first.

SCRIPT_DIR=`dirname $0`/ui-scripts.d

for filename in $SCRIPT_DIR/*
do
  ${filename}
  if [ $? == 0 ] ; then
    echo "ok ${filename}"
  else
    # just terminate, the child script will have already printed an error
    break
  fi
done

# get focus back to the terminal
case $TERM_PROGRAM in

  "Apple_Terminal")
    open -a Terminal
    ;;

  "iTerm.app")
    open -a iTerm
    ;;

esac
