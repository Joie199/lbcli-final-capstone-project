# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
txid=$(bitcoin-cli -regtest getblock $(bitcoin-cli getblockhash $block) true | jq -r '.tx[]' | xargs -I {} bitcoin-cli getrawtransaction {} true | jq -r 'select(.vin[].sequence < 4294967294) | .txid')
echo "$txid"