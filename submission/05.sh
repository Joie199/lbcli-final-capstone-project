# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

tx=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect="167.172.185.136" -rpcport=38332 getrawtransaction $txid true)

prevtx=$(echo "$tx" | jq -r '.vin[0].txid')
vout=$(echo "$tx" | jq -r '.vin[0].vout')

inputs=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect="167.172.185.136" -rpcport=38332 getrawtransaction $prevtx true | jq ".vout[$vout].value")

outputs=$(echo "$tx" | jq '[.vout[].value] | add')

echo "($inputs - $outputs) * 100000000" | bc