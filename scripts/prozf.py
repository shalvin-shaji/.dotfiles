#/usr/bin/env python3

import os
import pathlib

def list_projects():
    projects = {}
    base_dir = f"{os.getenv('HOME')}/projects"
    for language in os.listdir(base_dir):
        language_path = pathlib.Path(language)
        for project in os.listdir(os.path.join(base_dir, language)):
            project_path = pathlib.Path(os.path.join(base_dir, language, project))
            projects[f'{language_path.name}::{project_path.name}'] = project_path
    return projects
