#!/bin/sh
# set -e

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	if [ ! -f "$dir/go.mod" ]; then
		continue
	fi
	echo --------------------------------------------------------------------------
	echo $dir
	cd $dir
	go mod tidy
	go install
	cd ..
done
