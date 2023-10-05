#!/bin/sh

# Use Apple supplied python, so we can bootstrap, and because it's easier to
# uninstall here that if it's installed with `brew`.
# This path is certain to change in future OS releases.
export PATH=$HOME/Library/Python/3.9/bin:$PATH
pip3 install ansible

PLAYBOOK_DIR=`dirname $0`/playbook
cd $PLAYBOOK_DIR
ansible-galaxy install -r requirements.yml

ansible-playbook main.yml
