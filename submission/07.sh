# what is the coinbase tx in this block 243,834
hash=$(bitcoin-cli getblockhash 243834)
coinbase_txid=$(bitcoin-cli getblock $hash | jq -r '.tx[0]')
echo "$coinbase_txid"
