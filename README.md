# geth-node

## Berlin upgrade
https://www.ethernodes.org/berlin

## Geth
https://geth.ethereum.org/docs/install-and-build/installing-geth#install-on-ubuntu-via-ppas

https://github.com/ethereum/go-ethereum

```
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
```

Dump config:
```
geth --rpcapi eth,web3,debug,txpool,net,shh,db,admin,debug --rpc --ws --gcmode full --rpcport=5011 dumpconfig
```