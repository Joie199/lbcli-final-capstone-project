# How many new outputs were created by block 243,825?
block=243825
hash=$(bitcoin-cli -signet getblockhash $block)
txids=$(bitcoin-cli -signet getblock "$hash" | jq -r '.tx[]')

echo "$txids"