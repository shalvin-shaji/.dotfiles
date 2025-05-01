#!/usr/bin/env python3

import subprocess
import shlex
import fzfutils
import prozf

def create_session(name, startdir, window_name):
    try:
        command = f"tmux new-session -s '{name}' -c {startdir} -d -n {window_name}"
        run_command(command)
        return name
    except subprocess.CalledProcessError:
        return None


def run_command(command):
    try:
        result = subprocess.run(shlex.split(command), text=True, capture_output=True, check=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        print('error running', command)
        return None


def create_window(session, window_name, command):
    command = f"tmux new-window -t '{session}' -n '{window_name}' {command}"
    run_command(command)

def create_project():
    projects = prozf.list_projects()
    session, path = fzfutils.fzf_dict(projects)

    if session is not None:
        session = session.replace(':', '_')
    create_session(session, path, 'terminal')
    create_window(session, 'neovim', 'nvim .')

def switch_session():
    command =  'tmux list-sessions'
    output = run_command(command)
    if output is not None:
        sessions = output.splitlines()
        selection = fzfutils.fzf_list(sessions)
        if selection:
            name = selection.split(':')[0]
            run_command(f'tmux attach -t {name}')

