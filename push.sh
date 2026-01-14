#!/bin/bash

cd ~/github/save-files

git add .

# Commit changes with a timestamp
commit_msg="Pushed save games - $(date "+%Y-%d-%m %H:%M:%S")"
git commit -m "$commit_msg"

# Push changes
git push || { echo "Push failed."; exit 1; }