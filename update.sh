#!/bin/sh

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	cd $dir
	go get github.com/mpetavy/common@v1.8.92
	# go get github.com/kardianos/service@8eb6809ed2e7911d9538c90cbba90fb58866285a
	if [ -f "./update-vendor.sh" ]; then
		sh ./update-vendor.sh
	fi
	if [ -f "./scripts/update-vendor.sh" ]; then
		sh ./scripts/update-vendor.sh
	fi
	if [ "$dir" = "hydra" ]; then
		go run . -codegen
	fi
	go mod tidy
	go install
	cd ..
done
