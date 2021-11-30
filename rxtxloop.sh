#!/bin/bash

sleep 1
echo $(echo 'AT+I 0001<CR>' >  /dev/ttyACM2)
echo $(echo 'AT+I 0001<CR>' >  /dev/ttyACM0)  

sleep 1
echo $(echo 'ATPFR=868000000<CR>' >  /dev/ttyACM2)
echo $(echo 'ATPFR=868000000' >  /dev/ttyACM0)

sleep 1
##echo $(echo 'ATPBM=0<CR>' >  /dev/ttyACM2) ##text mode
echo $(echo 'ATPBM=1B<CR>' >  /dev/ttyACM2) ##hex mode

sleep 1
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
echo $(echo 'AT+RX' >  /dev/ttyACM2)
echo $(echo "AT+TX $line" >  /dev/ttyACM0)
##(stty raw; cat > received.txt) < /dev/ttyACM0 >

if [ $c -eq $p ];
then
break
fi
((c++))
done
done < $file
echo "Done Receiving $p packets"
