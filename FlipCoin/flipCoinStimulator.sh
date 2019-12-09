#!/bin/bash -x

coinFace=$(( RANDOM%2 ))
case $coinFace in
	1 )
		echo "Head";;
	0 )
		echo "Tail";;
esac

