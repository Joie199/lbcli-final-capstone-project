# what is the coinbase tx in this block 243,834
block=243834

tx=$(bitcoin-cli -signet getblock $(bitcoin-cli getblockhash $block) true | jq -r '.tx[0]')
echo "$tx"