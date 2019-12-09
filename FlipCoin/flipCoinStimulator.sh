#!/bin/bash -x

echo "Welcome to the Flip Coin Stimulator"

coinFace=$(( RANDOM%2 ))
case $coinFace in
        1 )
                echo "Head";;
        0 )
                echo "Tail";;
esac
