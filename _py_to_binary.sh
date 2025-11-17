#!/usr/bin/env bash
# generic package fields
name=$(grep "^name=" pyproject.toml | sed 's/.*=//g' | tr -d '"')
version=$(grep "^version=" pyproject.toml | sed 's/.*=//g' | tr -d '"')
description=$(grep "^description=" pyproject.toml | sed 's/.*=//g' | tr -d '"')
url=$(grep "^Repository=" pyproject.toml | sed 's/.*=//g' | tr -d '"')
author=$(grep "^authors=" pyproject.toml | sed 's/.*=//g' | sed 's/}]$//g' | tr -d '"')
license=$(grep "^license=" pyproject.toml | sed 's/.*=//g' | sed 's/}$//g' | tr -d '"')
# cleanup
rm -rf build/ dist/ pyinstaller_venv/ "$name.egg-info/" "$name.spec"
chmod 775 "$name.py"
# consistent date for reproducible builds
release_timestamp=$(date +%s)
if [ -n "$1" ]; then
    release_timestamp=$(date --date="$1" +%s)
elif [ -d ".git/" ]; then
    release_timestamp=$(git log -1 "$version" --format=%ct 2>/dev/null)
    if [ -z "$release_timestamp" ]; then
        release_timestamp=$(date +%s)
    fi
fi
timeofday=$((release_timestamp % 86400))
timestamp=$((release_timestamp - timeofday))
# bundle the main entry with dependencies into a binary using PyInstaller
python -m venv pyinstaller_venv
source ./pyinstaller_venv/bin/activate
python -m pip install .
python -m pip install pyinstaller
python -m PyInstaller --onefile --name "$name" -c --manifest="$name:main" "$name.py"
deactivate
rm -rf build/ pyinstaller_venv/ "$name.egg-info/" "$name.spec"
