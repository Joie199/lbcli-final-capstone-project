# How many new outputs were created by block 243,825?
block=243825

hash=$(bitcoin-cli -signet getblockhash $block)

count=0

for tx in $(bitcoin-cli -signet getblock "$hash" | jq -r '.tx[]')
do
    outputs=$(bitcoin-cli -signet getrawtransaction "$tx" true | jq '.vout | length')
    count=$((count + outputs))
done

echo "$count"