# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"

tx=$($RPC getrawtransaction "$txid" true)

prevTxid=$(echo "$tx" | jq -r '.vin[0].txid')
vout=$(echo "$tx" | jq -r '.vin[0].vout')

prev=$($RPC getrawtransaction "$prevTxid" true)

inputBTC=$(echo "$prev" | jq -r ".vout[$vout].value")

outputBTC=$(echo "$tx" | jq '[.vout[].value] | add')

fee=$(echo "$inputBTC - $outputBTC" | bc)

feeSats=$(echo "$fee * 100000000 / 1" | bc)

roundedSats=$(( ((feeSats + 99) / 100) * 100 ))

roundedBTC=$(echo "scale=8; $roundedSats / 100000000" | bc)

finalfees=$(printf "%.8f\n" "$roundedBTC")

echo "$finalfees"