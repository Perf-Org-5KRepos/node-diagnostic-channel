#!/bin/bash #
# Helper script to compile/install the packages in the correct order
BASEDIR=$(dirname "$0")
pushd $BASEDIR/diagnostic-source
npm install && npm run clean && npm test
popd

for x in `ls $BASEDIR/pubs`; do
    pushd $BASEDIR/pubs/$x
    npm install && npm run clean && npm test
    popd
done

for x in `ls $BASEDIR/subs`; do
    if [ ! $x == ".gitignore" ]
    then
        pushd $BASEDIR/subs/$x
        npm install && npm test
        popd
    fi
done