#!/bin/sh
set -e

[ -f "go.work" ] rm go.work

go work init

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	go work use ./$dir
done
