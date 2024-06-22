set -e

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	cd $dir
	go get github.com/mpetavy/common@v1.4.23
	# go get github.com/kardianos/service@8eb6809ed2e7911d9538c90cbba90fb58866285a
	if [ -f "./update-vendor.sh" ]; then
		sh ./update-vendor.sh
	fi
	if [ "$dir" = "hydra" ]; then
		go run . -codegen
	fi
	go mod tidy
	go install
	cd ..
done
