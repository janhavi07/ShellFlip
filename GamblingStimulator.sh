#!/bin/bash -x
#VARIABLES
stake=0

read -p "Enter the number of days : " noOfDays
read -p "Enter the number of Games : " noOfGames

for (( i=1; i<=$noOfDays; i++ ))
do
	stake=$(( $stake +100 ))
	for(( j=1; j<=$noOfGames; j++ ))
	do
		bet=$(( $bet +1 ))
		if [ $stack -eq 0 ]
		then
			break
		else
			stack=$(( $stack -1 ))
		fi
	done
done
echo stake : $stake
echo bets : $bet
