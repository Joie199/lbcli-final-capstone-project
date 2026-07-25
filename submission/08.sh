# what block height was this tx mined ?
txid="49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb"

blockheight=$(bitcoin-cli gettransaction $txid | jq -r '.blockheight')
echo "$blockheight" 