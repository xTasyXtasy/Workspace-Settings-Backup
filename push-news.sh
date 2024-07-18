#!/bin/bash

echo -n "Type a commit message: "

read commit_message

git add . 

git commit -m "$commit_message"

git branch -M main

git push origin main

printf "\n\nUpdates sent!\n\n"
