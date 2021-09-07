#!/bin/bash

LOOP_STOP_FLAG=0
trap 'LOOP_STOP_FLAG=1; trap 1 2 3 4 9 15' 1 2 3 4 9 15
 
if [ ${GITHUB_ACCOUNT} = "" ]; then
    exit 1
fi

if [ ${GITHUB_REPOSITORY_NAME} = "" ]; then
    exit 1
fi

if [ ${DIRECTORY_NAME} = "" ]; then
    DIRECTORY_NAME=${GITHUB_REPOSITORY_NAME}
fi

echo "------------------------------------------------------"
echo 
date
echo "command: git clone"
rm -rf ${DIRECTORY_NAME}
git clone https://github.com/${GITHUB_ACCOUNT}/${GITHUB_REPOSITORY_NAME}.git ${DIRECTORY_NAME}
echo
echo "------------------------------------------------------"
echo
cd ${DIRECTORY_NAME}

while [ $LOOP_STOP_FLAG -eq 0 ]
do
    git fetch origin

    if [ `git diff origin/master | wc -l` -ne 0 ]; then
        echo
        echo "------------------------------------------------------"
        date
        echo "command: git diff origin/master"
        git pull
        echo
        echo "------------------------------------------------------"
        echo
    fi

    sleep 1
done

exit 0
