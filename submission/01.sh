# What is the hash of block 243,833?
block=243,833
hash=$(bitcoin-cli -rigtest getblockhash $block)
echo $hash