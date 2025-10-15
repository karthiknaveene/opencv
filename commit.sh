#!/bin/bash

# Set variables
REPO_DIR="/Users/kelango/GolandProjects/opencv"  # Local path to your git repository
COMMIT_MESSAGE="Automated commit"  # The commit message
BRANCH="branch-36"  # The branch you want to commit to, e.g., "main" or "master"
GITHUB_USER="karthiknaveene"  # Your GitHub username

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "Repository not found!"; exit 1; }

# Check if there are any changes to commit
git status -s
if [[ -z "$(git status --porcelain)" ]]; then
  echo "No changes detected, nothing to commit."
  exit 0
fi

# Add all changes to staging (you can customize this to only add specific files)
git add .

# Commit the changes
git commit -m "$COMMIT_MESSAGE"

# Check if commit was successful
if [ $? -eq 0 ]; then
  echo "Changes committed successfully."
else
  echo "Commit failed!"
  exit 1
fi

# Push the changes to the remote repository
git push origin "$BRANCH"

# Check if push was successful
if [ $? -eq 0 ]; then
  echo "Changes pushed successfully to GitHub."
else
  echo "Push failed!"
  exit 1
fi
