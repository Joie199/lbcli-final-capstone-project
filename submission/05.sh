# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
txid="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

in_sum=0

for row in $(bitcoin-cli -signet getrawtransaction "$txid" true | jq -r '.vin[] | "\(.txid):\(.vout)"')
do
    prev_txid=$(echo "$row" | cut -d: -f1)
    vout_index=$(echo "$row" | cut -d: -f2)

    value=$(bitcoin-cli -signet getrawtransaction "$prev_txid" true \
    | jq -r ".vout[$vout_index].value")

    in_sum=$(echo "$in_sum + $value" | bc)
done

out_sum=$(bitcoin-cli -signet getrawtransaction "$txid" true \
| jq '[.vout[].value] | add')

echo "($in_sum - $out_sum) * 100000000" | bc