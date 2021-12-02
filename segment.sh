#!/bin/bash

#dd if=nike.pgm ibs=1 skip=1 count=3
##echo $count
##split -b 25k -d nike.pgm

echo "Enter File Name"
read name
file="$name"
   
x=$(wc -c "$name" | awk '{print $1}' ) #get file size in bytes
let "y= $x/10" #divide into chunks

echo "Total bytes: $x --- One segment: $y"
echo "-----------------------------------"

n=0
r=$x 
while [ $n -le $x ]
do
r=$((x-n))
echo "Starting Byte:$n ------------ Remaining:$r"
dd if="$name" ibs=1 skip=$n count=$y>> wr.txt #write to file
echo "------------------------------------------"

sleep 1
n=$((n+y))

done

echo "Remaining: $((r-r))"

#done < $file
