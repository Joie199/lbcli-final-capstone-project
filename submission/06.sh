# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
block=243821

txid=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash $block) true \
| jq -r '.tx[]' \
| xargs -I {} bitcoin-cli -signet getrawtransaction {} true \
| jq -r 'select(.vin[].sequence < 4294967294) | .txid')

echo "$txid"