x=0
while [ $x -lt  $1 ]; do
busybox sleep 1.5
 input tap 360 750
busybox sleep 0.1
 input tap 360 800
 (( x++ ))
# echo $x
done 