# Quick Start

Due to the rapid iterative development of the testnet, we only provide pre-compiled executable files right now. Please download through the [official channel](https://github.com/hbtc-chain/testnet). **NOTE** the current testnet version is v0.9.0.

****The cross-chain assets for testnet only support BTC, ETH, TRX mainnet tokens, ERC20 tokens such as USDT, LINK, HT and TRC20 tokens such as USDT are supported currently. Please be noted that ALL other ASSETS/TOKENS than above -mentioned will not be credited if deposit into the testnet.**

## Join HBTC Testnet
Clone [testnet project](https://github.com/hbtc-chain/testnet.git) to local:

```
git clone https://github.com/hbtc-chain/testnet.git
```

### Setup configration and genesis files
Copy the config directory in `testnet`  to `$HOME/hbtcchain/node` directory. Edit the node alias `moniker` in the configuration file `$HOME/hbtcchain/node/config/config.toml`. 

```
# A custom human readable name for this node
moniker = "<your_custom_moniker>"
```

### Nodes Startup
#### Start with binary

Go to the `$HOME/hbtcchain/node` directory, copy the executable file `hbtcd` from the project `testnet` to this directory, and start with the following command:

```
./hbtcd start --home ./
```

## Interact with HBTC chain

After the full nodes have synchronized all the blocks within the whole network, we can use the tool (hbtccli) under command line to interact with the HBTC Chain, and run the following command to check all the commands.

```bash
$ hbtccli help
```

We give a brief introduction on the process of cross-chain asset deposit, transfer and withdrawal, please be noted that the following is interactive operation with the Ethereum mainnet.

### 1.  Create and manage HBTC chain custodian units
```bash
$ hbtccli keys add alice --home node/hbtccli
```
With above command we created an ALICE custodian unit under the specified node directory (you need to enter your password to encrypt the custodian unit key during creation), and it was successfully created as follows:
```json
{
  "name": "alice",
  "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
  "pubkey": "hbcpub1addwnpepqdp4ac6l2f7tjtwssvdra7fy2xfrl8th4ltcx4dgy60z2a7ffx5lcu2ja8v",
}
```

### 2. Create cross-chain custodian addresses for Ethereum
```bash
$ hbtccli tx keygen keygen alice eth HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q  --chain-id hbtc-testnet --home node/hbtccli
```
With above command we created a cross-chain custodian address of ETH for ALICE, and wait 2-3 blocks after the command was sent and executed (it takes some time for distributed key generation), we can get the cross-chain custodian address of ETH by querying the corresponding custodian information with the following command:
```bash
$ hbtccli query cu cuinfo HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q --chain-id hbtc-testnet --home node/hbtccli
```
The response to the query should be as follows:
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
    "assets": [
      {
        "denom": "eth",
        "address": "0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B",
        "enbale_sendtx": true
      }
    ],
    "asset_pubkey": "A/dbw3DsU9HGTnglann9ZvlGl1gCPsC+8/2gWNrjhcQ3"
  }
}
```
According to the response, we have created a cross-chain custodian address of ETH for the custodian unit (0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B), and private key shares of this address is stored by each distributed validator node, and the public key to be visible on the custodian unit (assert_pubkey).

### 3. Deposit cross-chain assets
Generate your own eth cross-chain address (0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B) and deposit a certain amount of eth, HBTC Chain will automatically scan the cross-chain address of the custodian unit and the deposit will be credited to the corresponding custodian unit on HBTC Chain. For example, ALICE deposited 0.5eth and the information for the corresponding custodian unit as follows:
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
    "coins": [
      {
        "denom": "eth",
        "amount": "500000000000000000"
      }
    ],
    "assets": [
      {
        "denom": "eth",
        "address": "0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B",
        "nonce": "2",
        "enable_sendtx": true
      }
    ],
}
```

### 4. Cross-chain assets Transfer
```bash
$ hbtccli tx send alice  BHccpSzNbAPue6QBTfN8259t12CfxC9NY2K  100000000000000000eth --chain-id hbtccli-testnet --home node/hbtccli
```
With above command we transferred 0.5eth of the current custodian unit's deposit to another custodian address, and the other party's account will receive an incremental 0.1eth of assets.

### 5. Withdraw cross-chain assets
```bash
$ hbtccli tx transfer withdrawal alice 0xC933C741416151dAcFE9428d39222f747e2b45EB 200000000000000000eth 21000000000000000 --chain-id hbtc-testnet --home node/hbtccli
```
With this command, custodian  user alice withdrew 0.2eth from her custodian account to her eth account (0xC933C741416151dAcFE9428d39222f747e2b45EB non-custodian address), and alice can see the withdrawal information in her account after a certain block height.

### 6. Cancel withdrawal
```bash
$ hbtccli tx transfer cancelwithdrawal alice abe0f640-9fbe-4456-9873-fd402b90b044 --chain-id hbtc-testnet --home node/hbtccli
```
With this command, custodian user alice can cancel the withdrawal command she sent just now (the withdrawal operation hasn't been in distributed signing part yet), then the asset and fees will refuned into alice's account.

