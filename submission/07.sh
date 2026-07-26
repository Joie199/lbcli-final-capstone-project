# what is the coinbase tx in this block 243,834
RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"
hash=$($RPC getblockhash 243834)
coinbase_txid=$($RPC getblock $hash | jq -r '.tx[0]')
echo "$coinbase_txid"
