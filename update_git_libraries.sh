#!/bin/bash
# This script is uder to update the reference branch python libraries intall from git.
# It assumes if youre on a branch you want to use the corresponding branch of any personal libraries you're using
# it just requires your python requirements.txt file has a %branch wildcard in place of any branch name

# Get the branch
branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD}

# Get the requirements file
filename="requirements.txt"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sed -i "s/%branch/$branch_name/" $filename
elif [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/%branch/$branch_name/" $filename
fi