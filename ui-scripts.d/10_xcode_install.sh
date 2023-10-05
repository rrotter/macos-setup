#!/bin/sh

open -a "App Store"
osascript	-e 'display dialog "Log in to App Store, start XCode install before continuing"' > /dev/null
