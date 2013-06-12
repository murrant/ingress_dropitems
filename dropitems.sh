## Ingress Item Drop Script ##
# v1.2
#
# ***** WARNING, this may recycle your items, test with one item first! *****
#
# It is best to trigger this while you are in Ingress with something like Tasker
# Requires an argument to determine the number of items to drop
# Example: sh dropitems.sh 2000
#
# Original idea posted by Adam Outler
# https://plus.google.com/104711040110222472212/posts/TpF2vjm5gUA
#
# @2013 Tony Murray
# This is free and unencumbered software released into the public domain.
# http://unlicense.org/

# Wait for ingress to come back, it is much faster with location smoothing
busybox sleep 1

# Figure out the button locations, modify to suit your device
screenwidth=720
screenheight=1280

# TODO: Ratios need verification on various screen sizes, could be off since sizes are based on DPI, not resolution
# Set these manually if the guess based of screen resolution is wrong
hcenter=$(($screenwidth / 2))
vcenter=$(($screenheight / 2))
opsx=$(($screenwidth * 9 / 10))
opsy=$(($screenheight * 7 / 100))
dropy=$(($screenheight * 92 / 100))

# Troublshooting to see the actual values
#echo $hcenter $vcenter $opsx $opsy $dropy

x=0
while [ $x -lt  $1 ]; do
 # Tap Ops button
 input tap $opsx $opsy
 busybox sleep 0.1

 # Tap current item
 input tap $hcenter $vcenter
 busybox sleep 0.01

 # Tap drop button
 input tap $hcenter $dropy
 busybox sleep 0.01

 # Incriment x
 (( x++ ))
 # print out count, for testing.
# echo $x
done
