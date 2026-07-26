# Which tx in block 216,351 spends the coinbase output of block 216,128?
RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"

block_hash=$($RPC getblockhash 216128)

block_hash2=$($RPC getblockhash 216351)

coinbase_txid=$($RPC getblock "$block_hash" 1 | jq -r '.tx[0]')

spending_txid=$($RPC getblock "$block_hash2" 2 | jq -r --arg txid "$coinbase_txid" '.tx[] | select(.vin[]?.txid == $txid) | .txid')

echo "$spending_txid"