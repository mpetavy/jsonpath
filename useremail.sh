#!/bin/sh
set -e

# https://stackoverflow.com/questions/3042437/how-to-change-the-commit-author-for-a-single-commit/28845565#28845565

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	cd $dir
	git filter-branch --env-filter '

	CORRECT_NAME="mpetavy"
	CORRECT_EMAIL="mpetavy"

	if [ "$GIT_COMMITTER_EMAIL" != "$CORRECT_EMAIL" ]
	then
	    export GIT_COMMITTER_NAME="$CORRECT_NAME"
	    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
	fi
	if [ "$GIT_AUTHOR_EMAIL" != "$CORRECT_EMAIL" ]
	then
	    export GIT_AUTHOR_NAME="$CORRECT_NAME"
	    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
	fi
	' --tag-name-filter cat -- --branches --tags

	git push --force --tags origin 'refs/heads/*'
	cd ..
done
