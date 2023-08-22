# Bitkub Chain Node


### Download Geth
```bash
# Linux
curl -L $(curl -s https://api.github.com/repos/bitkub-chain/bkc/releases/latest |grep browser_ |grep linux-arm64 |cut -d\" -f4) -o geth.linux-arm64.tar.gz
tar -xf geth.linux-arm64.tar.gz
chmod -v u+x geth

# MacOS
curl -L $(curl -s https://api.github.com/repos/bitkub-chain/bkc/releases/latest |grep browser_ |grep darwin-amd64 |cut -d\" -f4) -o geth.darwin-arm64.tar.gz
tar -xf geth.darwin-arm64.tar.gz
chmod -v u+x geth
```

### Download Config/Genesis and Initial Genesis Block
```bash
$ curl -s https://raw.githubusercontent.com/bitkub-chain/bkc-node/main/mainnet/config.toml -o /Users/topj/bkchain/config.toml

$ curl -s https://raw.githubusercontent.com/bitkub-chain/bkc-node/main/mainnet/genesis.json -o /Users/topj/bkchain/genesis.json

$ geth --datadir /Users/topj/bkchain init /Users/topj/bkchain/genesis.json
```

### Running a Validator
```bash
$ echo "<<YourPassword>>" > /Users/topj/bitkubchain/password.sec

$ geth account new  --datadir /Users/topj/bitkubchain --password /Users/topj/bitkubchain/password.sec

$ geth --datadir /Users/topj/bitkubchain --syncmode snap \
  --password /Users/topj/bitkubchain/password.sec \
  --mine --unlock 0x<<YourAccountAddress>> \
  --allow-insecure-unlock
```


### Running a Fullnode

```bash
$ geth --datadir /Users/topj/bitkubchain init /Users/topj/bitkubchain/genesis.json

$ geth --datadir /Users/topj/bitkubchain --config /Users/topj/bitkubchain/config.toml--syncmode full
```


### Running a Archivenode

```bash
$ geth --datadir /Users/topj/bitkubchain init /Users/topj/bitkubchain/genesis.json

$ geth --datadir /Users/topj/bitkubchain --config /Users/topj/bitkubchain/config.toml --syncmode full --gcmode archive
```