#!/usr/bin/env python3

import os
import subprocess
import pathlib


def fzf_dict(inputs):
    try:
        result = subprocess.run(
            ["fzf"], input="\n".join(inputs), text=True, capture_output=True, check=True
        )
        return result.stdout.strip(), inputs[result.stdout.strip()]
    except subprocess.CalledProcessError:
        return None, None


def fzf_list(inputs):
    try:
        result = subprocess.run(
            ["fzf"],
            input="\n".join(map(str, inputs)),
            text=True,
            capture_output=True,
            check=True,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None

def list_projects():
    projects = {}
    base_dir = f"{os.getenv('HOME')}/projects"
    for language in os.listdir(base_dir):
        language_path = pathlib.Path(language)
        for project in os.listdir(os.path.join(base_dir, language)):
            project_path = pathlib.Path(os.path.join(base_dir, language, project))
            projects[f'{language_path.name}::{project_path.name}'] = project_path
    return projects

