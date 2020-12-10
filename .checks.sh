#!/bin/sh
SCORE=0
PASS=0
TEST_1=$(grep -io 'failures="0"' ./target/surefire-reports/*.xml |wc -l) >=1
TEST_3=$(grep -io 'errors="0"' ./target/surefire-reports/*.xml |wc -l) >=1
if [ -d ./target/test-classes/checkstyle ]; 
then PASS=$((PASS + 2))
fi;
if [ "$TEST_1" -eq 1 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_3" -eq 1 ]
then PASS=$((PASS + 1))
fi;
SCORE=$(($PASS * 25))
echo "FS_SCORE:$SCORE%"
