import os
import json

def load_secrets():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, './json/routine_names.json')
    with open(file_path, 'r') as file:
        return json.load(file)

print(load_secrets())