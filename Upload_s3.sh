#!/bin/bash

aws s3 cp s3://versioning-andrew/eProc/releaseversion.txt .

value=`cat releaseversion.txt`

new_value=`python3 main.py $value`

echo $new_value > releaseversion.txt

aws s3 rm s3://versioning-andrew/eProc/releaseversion.txt

aws s3 cp releaseversion.txt s3://versioning-andrew/eProc/releaseversion.txt

mv abcde.jar abcde_$new_value.jar
