#!/bin/bash

TARGET=/data/backup/eos

cd /ebs/eos-tool
if [ -f "./nodeos.pid" ]; then
    echo 'backup start' `date`
    ./stop.sh
    mkdir -p $TARGET/data
    rm -rf $TARGET/data/*
    cp -rf ./blocks $TARGET/data/
    cp -rf ./state $TARGET/data/
    ./start.sh
    rm -rf $TARGET/backup.tar.gz
    tar cvzfS $TARGET/backup.tar.gz $TARGET/data

    echo 'backupup finished' `date`
fi