#!/bin/bash -x

NO_OF_TIMES_FLIPPED=10

echo "Welcome to the Flip Coin Stimulator"

declare -A flipResultDict

function getFlipResult () {
	for (( i=0;i<$NO_OF_TIMES_FLIPPED;i++ ))
	do
		unset flippedCoinResult
		for (( j=0;j<$1;j++ ))
		do
			coinFace=$(( RANDOM%2 ))
			case $coinFace in
        			1 )
						flippedCoinResult="H$flippedCoinResult";;
        			0 )
						flippedCoinResult="T$flippedCoinResult";;
			esac
		done
		flipResultDict[$flippedCoinResult]=$(( ${flipResultDict[$flippedCoinResult]} + 1 * 100 / $NO_OF_TIMES_FLIPPED ))
	done
}

function main () {
	read -p "Enter the number of coins to be flipped" numbOfCoins
	echo $numbOfCoins
	getFlipResult $numbOfCoins
	echo "Winner is: "
	for i in ${!flipResultDict[@]}
	do
		echo "$i ${flipResultDict[$i]}"
	done | sort -k2 -nr | head -1
}

main
