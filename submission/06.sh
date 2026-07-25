# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
block_hash=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 243821)
txid=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $block_hash | jq -r '.tx[] | select(.rbf == true) | .txid')
echo "$txid"