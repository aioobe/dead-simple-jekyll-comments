#!/bin/bash

# Check usage
if [ "$#" -lt 4 ]
then
    echo "Usage: ./add-comment.sh <reply_to> <author> <email> <text>"
    exit 1
fi

# Make sure our reference repo is up to date
if [ ! -d "repo" ]
then
    echo "Please clone reference repo:"
    echo "git clone <REPO_URL.git> repo"
    exit
fi
pushd repo
git fetch --all
git checkout master

# Read input
reply_to="$1"
author="$2"
email="$3"
text="$4"

# Create new branch
CID=$(date +%s)-$(pwgen)
BRANCH="comment/$CID"
git checkout -b "$BRANCH"

# Create comment file
FILE="_data/comments/$CID.yaml"
mkdir -p $(dirname "$FILE")
for field in reply_to author email text
do
    yq n "$field" "${!field}" >> "$FILE"
done

# Commit comment and push
git add "$FILE"
git commit -m "Added comment $CID."
git push origin "$BRANCH"
popd
