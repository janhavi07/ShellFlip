#!/bin/bash -x

#VARIABLES
headCount=0
tailCount=0

declare -A coin
read -p "Enter number of times to flip the coin : " noOfTimes
echo $noOfTimes
 
function flip()
{
	echo $1
}
for(( time=1; time<=noOfTimes ; time++ ))
do
flipresult="$( flip $((RANDOM%2)) )"
if [ $flipresult -eq 1 ]
then
	echo HEADS
	headCount=$(( $headCount + 1))

else
	echo TAILS
	tailCount=$(( $tailCount +1 ))

fi
done
echo No of heads percentage
headpercent=$(( ($headCount*100)/$noOfTimes ))
coin[head]=$headpercent
echo $headpercent

echo No of Tails
echo $tailCount
tailpercent=$(( ($tailCount*100)/$noOfTimes ))
coin[tail]=$tailpercent
echo $tailpercent
