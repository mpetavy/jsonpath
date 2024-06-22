set -e

for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
	dir=${dir%*/}      # remove the trailing "/"
	dir=${dir##*/}
	echo --------------------------------------------------------------------------
	echo $dir
	echo --------------------------------------------------------------------------
	cd $dir
	git add --all
	git commit -m "adjusted to common"
	git push https://$GIT_USERNAME:$GIT_PASSWORD@github.com/mpetavy/$dir
	git pull
	cd ..
done
