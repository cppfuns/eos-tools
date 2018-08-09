#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# https://github.com/CryptoLions/EOS-Jungle-Testnet
#
###############################################################################


NODEOSBINDIR="/ebs/eos/build/programs/nodeos"
DATADIR="/ebs/eos-tool"

$DATADIR/stop.sh
echo -e "Starting Nodeos \n";

# start to sync
#$NODEOSBINDIR/nodeos --genesis-json $DATADIR/genesis.json --max-irreversible-block-age 108000 --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid

# start to continue
$NODEOSBINDIR/nodeos --max-irreversible-block-age 108000 --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid

# start to replay
#$NODEOSBINDIR/nodeos --replay-blockchain --wasm-runtime wavm --max-irreversible-block-age 108000 --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid