#!/bin/bash

echo "GPIO59: config-pin -l P2_01"
config-pin -l P2_01
sleep 1

echo "GPIO59: config-pin -q P2_01"
config-pin -q P2_01
sleep 1

echo "GPIO59: config-pin P2_01 gpio"
config-pin P2_01 gpio
sleep 1
