#!/bin/bash
for i in {1..5};
do
        /root/433Utils/RPi_utils/codesend $1 1 100
done
