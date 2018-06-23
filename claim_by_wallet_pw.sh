#!/bin/bash

# name to claim and wallet password
BP=eosbeijingbp
WALLET_PW=

# env
NODEOS_BIN_DIR='/eos/build/programs'
WALLET_HOST='127.0.0.1:3000'
NODE_HOST='127.0.0.1:8080'
CLEOS="$NODEOS_BIN_DIR/cleos/cleos -u http://$NODE_HOST --wallet-url http://$WALLET_HOST"

# step 1: wait until 24 hours from last claim
last_claim_time=`$CLEOS get table eosio eosio producers -l 1000 | jq -r '.rows[] | select(.owner == "'$BP'") | .last_claim_time'`
now=`date +%s%N`
diff=`expr $last_claim_time / 1000000 + 24 \* 3600 - $now / 1000000000 + 1`
echo "wait for ${diff}s"
sleep $diff

# step 2: unlock wallet and claim
$CLEOS wallet open
$CLEOS wallet unlock --password $WALLET_PW
$CLEOS system claimrewards $BP
echo 'claimed at ' `date`

# step 3: clean
$CLEOS wallet stop
history -c
history -w
