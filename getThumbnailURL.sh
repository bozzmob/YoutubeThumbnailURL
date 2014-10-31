#!/bin/sh
opfile=$1output.json
echo "{ \"channels\" : [" >> $opfile
while read line
do
	consturl="https://www.youtube.com/user/"
	echo $consturl
	echo $line
	consturl=$consturl$line
	echo $consturl
	wget $consturl
	imgurl=$(grep "appbar-nav-avatar" $line | grep -o 'https.*jpg')
#	title=$(grep "branded-page-header-title-link" $line | grep -io 'title=".*"')
	echo $imgurl
        title=$(grep "<title>" $line)
	echo $title  >> title.txt
#	echo -e "{\"userid\":\""$line"\", \"title\":\""$title"\", \"imgurl\":\""$imgurl"\"}" >> output.txt
        echo "{\"userid\":\""$line"\", $title\", \"imgurl\":\""$imgurl"\"}," >> $opfile
#        echo -e "{\"userid\":\""$line"\", \"title\":\""$title"\", \"imgurl\":\""$imgurl"\"}" >> output.txt
	rm $line
done < $1
echo "]}" >> $opfile
cat $opfile
sed -i 's/<title>  /"title":"/g' $opfile
sed -i 's/""/"\/images\/default.png"/g' $opfile
cat $opfile
#echo $1"\t"$imgurl >> output.txt
