#/bin/bash
name=`curl $1 | grep my_show__name| awk -F ">" '{ print $2}'| awk -F "<" '{print $1}' `
mkdir $name
cp dl.sh $name 
cd $name
curl $1 | grep "=personal" | awk -F"\"" '{print $2}'|cat |while read LINE 
do 
	./dl.sh $LINE
done
cd ../
tar -zcf $name.tar.gz $name
rm -rf $name 
exit 0
