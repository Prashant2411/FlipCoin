#!/bin/bash -x

echo "Welcome to the Flip Coin Stimulator"

declare -A flipResultDict
declare -A flipPercent

function getCoinFace () {
	echo $(( RANDOM%2 ))
}

function getFlipResult () {
	for (( i=0;i<10;i++ ))
	do
		unset res
		for (( j=0;j<$1;j++ ))
		do
			coinFace=$( getCoinFace )
			case $coinFace in
        			1 )
						res="H$res";;
        			0 )
						res="T$res";;
			esac
		done
		flipResultDict[$res]=$(( ${flipResultDict[$res]} + 1 ))
	done
}

function getPercent () {
	for index in "${!flipResultDict[@]}"
	do
		value1="${flipResultDict[$index]}"
		flipPercent[(($index))]=$(( $value1 * 10 ))
	done
}

function main () {
	getFlipResult 1
	getPercent
	echo ${flipResultDict[@]}
	echo ${flipPercent[@]}
}
