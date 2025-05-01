#!/usr/bin/env zsh

function sw() {
	$(python3 -c 'import tmuxutils;tmuxutils.switch_session()')
}

function cs() {
	$(python3 -c 'import tmuxutils;tmuxutils.create_project()')
}
