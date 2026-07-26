# what block height was this tx mined ?
txid="49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb"
RPC="bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332"
blockheight=$($RPC getrawtransaction "$txid" true | jq -r '.blockhash' | xargs -I {} $RPC getblock {} | jq -r '.height')
echo "$blockheight"