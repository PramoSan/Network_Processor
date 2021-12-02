#!/bin/bash

echo "Enter File Name"
read name
file="$name"
while read line; do
echo $line

valid=true
c=1
p=5

while [ $valid ]
do
sleep 0.5
echo -n '$' >> wr.txt

##cat $name >> wr.txt

if [ $c -eq $p ];
then
break
fi

((c++))
done
done < $file
