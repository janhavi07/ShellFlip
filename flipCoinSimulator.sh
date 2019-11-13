#!/bin/bash -x

#VARIABLES
headCount=0
tailCount=0

declare -A singlet
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
echo No of heads
echo $headCount
headpercent=$(( ($headCount*100)/$noOfTimes ))
singlet[head]=$headpercent
echo $headpercent

echo No of Tails
echo $tailCount
tailpercent=$(( ($tailCount*100)/$noOfTimes ))
singlet[tail]=$tailpercent
echo $tailpercent

declare -A doublet
HHcout=0
TTcount=0
HTcount=0
THcount=0
function fliptwo()
{
	echo $1
}
for (( times=1; times<=noOfTimes; times++ ))
do
	coin1=$( fliptwo $((RANDOM%2)) )
	coin2=$( fliptwo $((RANDOM%2)) )
	if [ $coin1 -eq 1 ] && [ $coin2 -eq 1 ]
	then
		HHcount=$(( $HHcount +1 ))
		echo $HHcount
	elif [ $coin1 -eq 0 ] && [ $coin2 -eq 0 ]
	then
		TTcount=$(( $TTcount +1 ))
	elif [ $coin1 -eq 0 ] && [ $coin2 -eq 1 ]
	then
		THcount=$(( $THcount +1 ))
	elif [ $coin1 -eq 1 ] && [ $coin2 -eq 0 ]
	then
		HTcount=$(( $HTcount +1 ))
	fi
done

echo percentage of HH
HHP=$(( ($HHcount*100)/$noOfTimes ))
doublet[HH]=$HHP
echo ${doublet[HH]}

echo perecentage of TT
TTP=$(( ($TTcount*100)/$noOfTimes ))
doublet[TT]=$TTP
echo ${doublet[TT]}

echo percentage of HT
HTP=$(( ($HTcount*100)/$noOfTimes ))
doublet[HT]=$HTP
echo ${doublet[HT]}

echo percentage of TH
THP=$(( ($HHcount*100)/$noOfTimes ))
doublet[TH]=$THP
echo ${doublet[TH]}

declare -A triplet
declare -A resultTriplet
read -p "Enter the number of coins : " noOfCoins

function triplet()
{
	for(( i=1; i<=$1; i++ )) 
	{
		str=""
		for (( k=1; k<=$2; k++ ))
		do

				result=$((RANDOM%2))
				if [ $result -eq 1 ]
				then
					str="${str}H"
					echo "${str}"
				elif [ $result -eq 0 ]
				then
					str="${str}T"
					echo "${str}"
				fi
		done
		triplet[$str]=$(( ${triplet[$str]} +1 ))
		resultTriplet[$str]=$(( (${triplet[$str]}*100)/$noOfTimes ))
	}
}

triplet noOfTimes noOfCoins
echo  ${triplet[@]} #prints the no of key values occured
echo ${!triplet[@]} #prints all the key values
echo ${resultTriplet[@]} #prints the percentage 
