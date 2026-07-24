# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
block_hash=$(bitcoin-cli getblockhash 243821)
txid=$(bitcoin-cli getblock $block_hash | jq -r '.tx[] | select(.rbf == true) | .txid')
echo "$txid"