git add .

# Commit changes with a timestamp
commit_msg="Pushed save games - $(date "+%Y-%m-%d %H:%M:%S")"
git commit -m "$commit_msg"

# Push changes
git push || { echo "Push failed."; exit 1; }