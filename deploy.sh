#!/bin/sh

# Build the project.
hugo

# Go to public directory.
cd ./public

# Add changes to git.
git add .

# Create a commit message.
# DATETIME=Get-Date -format "yyyy-MM-dd HH:mm:ss K"
DATETIME=`date "+%Y-%m-%d %H:%M:%S %:z"`
COMMIT_MSG="Site updated: ${DATETIME}"

# Commit.
git commit -m "${COMMIT_MSG}"

# Push source and build repos.
git push origin master

# Come back to the project root.
cd ./..

# Organize posts.
# powershell ./organize-posts.ps1

echo "\e[36mThe web page has been updated!\e[m"
