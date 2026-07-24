# Which tx in block 216,351 spends the coinbase output of block 216,128?
coinbase_txid=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 216128) | jq -r '.tx[0]')
spending_txid=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 216351) | jq -r --arg txid "$coinbase_txid" '.tx[] | select(.vin[].txid == $coinbase_txid) | .txid')
echo "$spending_txid"