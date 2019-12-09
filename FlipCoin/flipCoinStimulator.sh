#!/bin/bash -x

HEAD=0
TAIL=0

declare -A flipResultDict

echo "Welcome to the Flip Coin Stimulator"

for (( i=0;i<10;i++ ))
do
	coinFace=$(( RANDOM%2 ))
	case $coinFace in
        	1 )
                	flipResultDict[((Flip$i))]="Head"
			head=$(( $head + 1 ));;
        	0 )
			flipResultDict[((Flip$i))]="Tail"
			tail=$(( $tail + 1 ));;
esac
done

echo "Head Percent: $(( $head * 10 ))"
echo "Tail Percent: $(( $tail * 10 ))"
