#!/bin/bash -x

echo "Welcome to the Flip Coin Stimulator"

declare -A flipResultDict

function getFlipResult () {
	for (( i=0;i<$FLIP_NUMBER;i++ ))
	do
		unset res
		for (( j=0;j<$1;j++ ))
		do
			coinFace=$(( RANDOM%2 ))
			case $coinFace in
        			1 )
						res="H$res";;
        			0 )
						res="T$res";;
			esac
		done
		flipResultDict[$res]=$(( ${flipResultDict[$res]} + 1 * 100 / 10 ))
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
