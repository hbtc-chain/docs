# Nodes Operation & Deployment

## Supporting platforms

HBTCChain full nodes support Windows, Unix Programming Envirment  (mac OS、ubuntu、centos), etc.

## Basic configuration requirements

- 8 GB *RAM* with 4 *core* processor, and 500 GB+of space 
- Stable internet speed of at least 2MB/s
- Better deploy on AWS Server environment

## Node type

### Ordernary nodes
Participate in block transfer and transaction, and provide RPC services

No limited amount 

### Consensus nodes 
Participate in transaction packaging, and RPC services and block consensus

Amount of the consensus nodes is not fixed, and currently there will be no more than 35 consensus nodes, which will be the top 35 nodes on token pledge list with pledged at least 100,000HBC   

###  Core nodes
Except the duties of consensus nodes, Core nodes will also responsible for all cross-chain operations, including distributed private key generation & signature, cross-chain transaction verification and transferring.  

7 Core nodes will be selected at early stage, may be adjusted as appropriate. 

#### Requirement of operation core nodes 
- Pledged tokens shall be at the forefront of pledge list (top 7 currently), with no less than 500,000 HBC
- Blockchain nodes and settlement nodes shall be deployed on defferent servers (please refer to the above configuration requirement) 
- Access to public network is not required for settlement nodes, while data needs to be properly backed up.  
- Complete public chain full nodes need to be deployed  (such as eth/btc/tron）

## Set Config file and genesis file 

copy the config directory on mainnet to local $HOME/hbtcchain/node directory . Edit the node alias `moniker`in config file under$HOME/hbtcchain/node/config/config.toml:

```
# A custom human readable name for this node
moniker = "<your_custom_moniker>"
```

## Nodes Startup 

#### Start with binary

 Go to the `$HOME/hbtcchain/node` directory, copy the executable file  on mainnet to this directory, 

ordinary nodes and consensus nodes will execute with the following command:

```
./hbtcd start --home ./
```

Core nodes will execute the following additional command:

```
./bhsettled start --home ./
```
#### Start with docker

Enter the mainnet project and execute the command:

Ordinary nodes and consensus nodes will executewith the following command:

```
docker-compose -f docker-compose-chain.yml up -d
```
Core nodes will execute the following additional command:
```
docker-compose -f docker-compose-settle.yml up -d
```

#### Start with source code 

Install golang enviroment first

Enter into the accordingly project directory, compile the binary file 

```
cd bhchain/cmd/hbtcd
go build
cd ../../bhsettle/cmd/bhsettled
go build
```

Then refer to precedure on "Start with binary"

