#!/usr/bin/env zsh

cd ~/.dotfiles/scripts/
$(python3 -c 'import tmuxutils;tmuxutils.create_project()')
