# How many new outputs were created by block 243,825?
RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"
hash=$($RPC getblockhash 243825)
$RPC getblock "$hash" 2 | jq '[.tx[].vout[]] | length'