for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	cd $dir
	git pull --tags
	cd ..
done
