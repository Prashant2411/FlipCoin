#!/bin/bash -x

NO_OF_TIMES_FLIPPED=10

echo "Welcome to the Flip Coin Stimulator"

declare -A combinationSet

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
		combinationSet[$flippedCoinResult]=$(( ${combinationSet[$flippedCoinResult]} + 1 * 100 / $NO_OF_TIMES_FLIPPED ))
	done
}

function main () {
	read -p "Enter the number of coins to be flipped" numberOfCoins
	echo $numberOfCoins
	getFlipResult $numberOfCoins
	for i in ${!combinationSet[@]}
	do
		echo "$i ${combinationSet[$i]}"
	done | sort -k2 -nr | head -1
}

main
