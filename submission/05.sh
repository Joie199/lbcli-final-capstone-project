# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"
tx=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "$txid" true)
 in=0; for i in $(echo "$tx" | jq -r '.vin[] | "\(.txid):\(.vout)"'); do ptx=${i%:*}; pvout=${i#*:}
 val=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "$ptx" true | jq ".vout[$pvout].value")
 in=$(echo "$in + ($val * 100000000)" | bc); done; out=$(echo "$tx" | jq '[.vout[].value] | add * 100000000') 
 fee=$(echo "$input_sum - $output_sum" | bc)

echo "$fee"