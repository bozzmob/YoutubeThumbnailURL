#!/bin/sh
consturl="https://www.youtube.com/user/"
echo $consturl
echo $1
consturl=$consturl$1
echo $consturl
wget $consturl
imgurl=$(grep "appbar-nav-avatar" $1 | grep -o 'https.*jpg')
echo $1"\t"$imgurl >> output.txt
rm $1
