# How many new outputs were created by block 243,825?
hash=$(bitcoin-cli getblockhash 243825)
bitcoin-cli getblock $hash | jq '[.tx[].vout[]] | length'