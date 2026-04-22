# How many new outputs were created by block 243,825?
block=243825
hash=$(bitcoin-cli getblockhash $block)
txids=$(bitcoin-cli getblock "$hash" | jq -r '.tx[]')

echo "$txids"