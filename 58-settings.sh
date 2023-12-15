#!/bin/sh

### set default apps for opening text files ###

# some useful commands:
# duti -e txt # get UTTypeIdentifier for .txt extension
# duti -d public.plain-text # what app handles the public.plain-text uti?
# duti -l public.plain-text # what apps can handle the public.plain-text uti?
editor_bundle_id="com.macromates.TextMate"
for id in public.data public.plain-text public.text bash c h js json md pl pp py rb sh xml yaml zsh; do
  duti -sv $editor_bundle_id $id all
done
