#!/bin/sh

if [ `which convert` ]
then
	convert "$1" -resize 32x32 -colors "$2"  | sort -n -r
else
	echo "Need to install ImageMagick for this script to work."
fi
