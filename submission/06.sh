# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"

block_hash=$($RPC getblockhash 243821)

$RPC getblock "$block_hash" | jq -r '.tx[]' | xargs -I {} sh -c "$RPC getrawtransaction {} true | jq -e '.vin[]? | select(.sequence < 4294967294)' >/dev/null && echo {}"