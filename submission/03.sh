# Which tx in block 216,351 spends the coinbase output of block 216,128?
block=216128
target_block=216351

coinbase_hash=$(bitcoin-cli -signet getblockhash $block)
coinbase_txid=$(bitcoin-cli -signet getblock "$coinbase_hash" | jq -r '.tx[0]')

target_hash=$(bitcoin-cli -signet getblockhash $target_block)

tx=$(bitcoin-cli -signet getblock "$target_hash" | jq -r '.tx[]' | xargs -I {} bitcoin-cli getrawtransaction {} true | jq -r --arg cb "$coinbase_txid" ' select(.vin[]?.txid == $cb) | .txid')

echo "$tx"