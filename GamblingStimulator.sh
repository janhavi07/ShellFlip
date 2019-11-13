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
		winLose=$((RANDOM%2))
		if [ $winLose -eq 1 ]
		then
			stake=$(( $stake +1 ))
		else
			stake=$(( $stake -1 ))
		fi
	done
done
echo stake : $stake
echo bets : $bet
