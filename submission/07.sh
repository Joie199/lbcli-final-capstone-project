# what is the coinbase tx in this block 243,834
block=243834

blockhash=$(bitcoin-cli -signet getblockhash $block)
tx=$(bitcoin-cli -signet getblock "$blockhash" true | jq -r '.tx[0]')
echo "$tx"