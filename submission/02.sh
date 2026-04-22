# How many new outputs were created by block 243,825?
block=243825
hash=$(bitcoin-cli -regtest getblockhash $block)
txids=$(bitcoin-cli -regtest getblock "$hash" | jq -r '.tx[]')

echo "$txids"