#!/bin/bash

# Ensure the script stops if any command fails
set -e

# Check if you're in a Git repository
if [ ! -d ".git" ]; then
  echo "This is not a Git repository. Please run this script inside a Git repo."
  exit 1
fi

# Make sure you're on the default branch (usually main or master)
git checkout master

# Pull the latest changes from the remote to ensure we are up to date
git pull origin master

# Loop to create 100 branches
for i in {1..100}
do
  BRANCH_NAME="branch-$i"
  echo "Creating and pushing branch: $BRANCH_NAME"

  # Create the branch
  git checkout -b $BRANCH_NAME
  
  # Optionally, you can make changes in each branch, e.g., create a file, add content
  # echo "Some changes in $BRANCH_NAME" > "file_$i.txt"
  # git add "file_$i.txt"
  # git commit -m "Added file_$i.txt in $BRANCH_NAME"

  # Push the branch to remote
  git push origin $BRANCH_NAME

  # Switch back to the main branch
  git checkout master
done

echo "100 branches have been created and pushed to the remote repository."
