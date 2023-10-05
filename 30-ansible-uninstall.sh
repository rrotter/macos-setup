#!/bin/sh
# purge ansible, this installation was only for bootstrapping

rm -rf /tmp/ansible
pip3 uninstall -y ansible ansible-core
