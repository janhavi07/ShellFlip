#!/bin/bash -x
function flip()
{
	echo $1
}
flipresult="$( flip $((RANDOM%2)) )"
if [ $flipresult -eq 1 ]
then
	echo HEADS
else
	echo TAILS
fi

