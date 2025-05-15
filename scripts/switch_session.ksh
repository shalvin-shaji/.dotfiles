#!/usr/bin/env zsh

cd /home/shalv/.dotfiles/scripts/
$(python3 -c 'import tmuxutils;tmuxutils.switch_session()')

