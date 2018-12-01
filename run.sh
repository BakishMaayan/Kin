#!/usr/bin/env bash
set -ev
echo $(which pipenv)
FLASK_APP=app.py pipenv run flask run --host 0.0.0.0 --port 80
