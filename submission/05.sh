# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

in=$(bitcoin-cli getrawtransaction "$txid" true | jq '[.vin[].txid] | unique | .[]' | xargs -I {} bitcoin-cli getrawtransaction {} true | jq '[.vout[].value] | add')

out=$(bitcoin-cli getrawtransaction "$txid" true | jq '[.vout[].value] | add')

echo "($in - $out) * 100000000"