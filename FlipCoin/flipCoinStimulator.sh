#!/bin/bash -x

echo "Welcome to the Flip Coin Stimulator"

declare -A flipResultDict

function getFlipResult () {
	for (( i=0;i<10;i++ ))
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
		flipResultDict[$res]=$(( ${flipResultDict[$res]} + 1 * 10 ))
	done
}

function main () {
	getFlipResult 1
	getFlipResult 2
	getFlipResult 3
	echo "Winner is: "
	for i in ${!flipResultDict[@]}
	do
		echo "$i ${flipResultDict[$i]}"
	done | sort -k2 -nr | head -1
}

main
