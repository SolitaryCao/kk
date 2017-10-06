#/bin/bash
curl $1 | grep "=personal" | awk -F"\"" '{print $2}'|cat |while read LINE 
do 
	./dl.sh $LINE
done
exit 0
