# How many new outputs were created by block 243,825?
block=243825

hash=$(bitcoin-cli -signet getblockhash $block)

count=$(bitcoin-cli -signet getblock "$hash" \
| jq -r '.tx[]' \
| xargs -I {} bitcoin-cli -signet getrawtransaction {} true \
| jq '[.vout | length] | add')

echo "$count"