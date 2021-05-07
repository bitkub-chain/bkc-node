# Bitkub Chain Node

## Introduction
[Bitkub Chain](https://www.bitkubchain.com)  is an infrastructure of an ecosystem using decentralized technology “Blockchain” which allows anyone to interact with decentralized applications or their digital assets with a very low transaction fee, high-speed confirmation time, trustless and  transparency to everyone.

## Prerequisites
   - #### **Linux Instance**
        - ##### OS - Ubuntu version 18.04 
        - ##### Specifications
           - 4 vCPUs
           - 8 GiB of RAM
           - 1 TB of Disk
    
   - #### **Security Group / Firewall Rules** 
        - ##### Allow Inbound
          -  **Protocol** - TCP & UDP
          -  **Port** - 30303
          - **Source IP** - 0.0.0.0/0
                
## Installation Guide
#### 1. Clone Bitkub Chain Node github repo to your instance 
```shell
git clone https://github.com/bitkubchain/bkc-node
```
#### 2. Switch to bkc-node/ directory
```shell
cd bkc-node/
```
#### 3.  Execute a script file name `install.sh` that use for setup all dependencies which requires before start a Bitkub Chain node.
```shell
./install.sh 
```
#### 4. Select Bitkub Chain Network that you want to run a node `Mainnet` or `Testnet` 
```shell
# Go to mainnet directory if you need to run a Bitkub Chain mainnet node
cd mainnet 

# Go to testnet directory if you need to run a Bitkub Chain testnet node
cd testnet 
```
 #### 5. Initialized a geth folder using a `genesis.json` file
 ```shell
geth init --datadir ${YOUR DIRECTORY} genesis.json 
```
 #### 6. Run a node using a `config.toml` file 
 ```shell
geth --config config.toml --datadir ${YOUR DIRECTORY}
```
