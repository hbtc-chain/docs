# Command-line Reference

## status
Check the status of the chains

##### Example
```bash
hbtccli  status
```
##### Success Response
```json
{
  "node_info": {
    "protocol_version": {
      "p2p": "7",
      "block": "10",
      "app": "0"
    },
    "id": "9481d28e98c150ad4870da193efffb8488c75dfc",
    "listen_addr": "tcp://0.0.0.0:26656",
    "network": "hbtc-testnet",
    "version": "0.32.7",
    "channels": "402021222330380070",
    "moniker": "moniker",
    "other": {
      "tx_index": "on",
      "rpc_address": "tcp://127.0.0.1:26657"
    }
  },
  "sync_info": {
    "latest_block_hash": "B0003D14677A029F700B1D453EFD1FEF07419A24E073DD0112D90776175C802D",
    "latest_app_hash": "2ACF927F119C34AD6E0453E58663FA3BE8415CBD5551867A145198F0F617E2B0",
    "latest_block_height": "23",
    "latest_block_time": "2020-04-14T06:48:46.676629Z",
    "catching_up": false
  },
  "validator_info": {
    "address": "72549FB59081C03C47942C9C9F6772AB82903482",
    "pub_key": {
      "type": "tendermint/PubKeyEd25519",
      "value": "oPRW7385Qe+dd5Wka78vDLWUizXhShW854+jjj6fJuo="
    },
    "voting_power": "50"
  }
}

```
## config
### Display client configuration

##### Example
```bash
hbtccli config
```
##### Success Response
```bash
chain-id = "hbtc-testnet"
indent = true
output = "json"
trust-node = true
```

### Config Client

Store common configuration information into hbtcli/config/config.toml

```bash
hbtccli config <key> [value] [flags]
```

##### Example
```bash
hbtccli config indent  false
hbtccli config chain-id  hbtc-testnet
hbtccli config output  text
hbtccli config trust-node  true
```

## query

### tendermint-validator-set

Query current validators
```bash
hbtccli query tendermint-validator-set
```

#### Example
```bash
hbtccli query tendermint-validator-set
```
#### Success Response
```json
{
  "block_height": "65",
  "validators": [
    {
      "address": "hbcvalcons1wf2fldvss8qrc3u59jwf7emj4wpfqdyzzekl8l",
      "pub_key": "hbcvalconspub1zcjduepq5r69dmml89q7l8thjkjxh0e0pj6efze4u99pt088373cu05lym4qf6f6v0",
      "proposer_priority": "0",
      "voting_power": "50"
    }
  ]
}

```


### block
Query the content of the block with specified height

#### Example

```bash
hbtccli query  block 50
```
#### Success response
```json
{
  "block_meta": {
    "block_id": {
      "hash": "FA1FCD8F8572A8063CDDD257948392056196FEA9AA21211EA1B41571D57C64BC",
      "parts": {
        "total": "1",
        "hash": "D06276C3CCCAB211B55B604E041573D0922231C9C3AC0DFE6F7BA0109420587C"
      }
    },
    "header": {
      "version": {
        "block": "10",
        "app": "0"
      },
      "chain_id": "hbtc-testnet",
      "height": "50",
      "time": "2020-04-14T06:51:02.861804Z",
      "num_txs": "0",
      "total_txs": "0",
      "last_block_id": {
        "hash": "E468E15E142B4E9389A61001682E19B36DF44223FD53664F1DD1CE4A28453893",
        "parts": {
          "total": "1",
          "hash": "D0C914DF8B00F387345684AABE8141897A0F475507B9DDC4AFC15D3CC00D872D"
        }
      },
      "last_commit_hash": "E14461A6D39FC4D5093BDFEED79D160F5C5DD6340EDBBED6D365AA62AA24B47D",
      "data_hash": "",
      "validators_hash": "D46F0A134F3C91973543A26E82C8B81FAA010470494DEABF50CC77D9FCEF850D",
      "next_validators_hash": "D46F0A134F3C91973543A26E82C8B81FAA010470494DEABF50CC77D9FCEF850D",
      "consensus_hash": "048091BC7DDC283F77BFBF91D73C44DA58C3DF8A9CBC867405D8B7F3DAADA22F",
      "app_hash": "BE0BC9E5BC2E05072A61ED2B68EAAADFF70E6B38F048264C4EF0EBC67B58C5C6",
      "last_results_hash": "",
      "evidence_hash": "",
      "proposer_address": "72549FB59081C03C47942C9C9F6772AB82903482"
    }
  }
}
```

### txs
#### Example
```

```

#### Success response
```

```

### tx

Query a transaction by hash 

``` bash
hbtccli query tx [hash]
```


#### Example
```bash
hbtccli query tx E81EC801B96C99E99BA2EAA73624AF5FAA7A0356894846BB11C70D57B62937AD --trust-node
```

#### Success response
```json
{
  "height": "130",
  "txhash": "E81EC801B96C99E99BA2EAA73624AF5FAA7A0356894846BB11C70D57B62937AD",
  "data": "{Category:4 Flows:[{Symbol:eth CUAddress:1A44C7E097ECA1EFB9EAE78853A0B8EDD70A069D OrderID:efc5b260-e389-48f6-ae8d-197d60ba6ce6 OrderType:4 OrderStatus:7} {CuAddress:HBCNanXfwZxZpTBTJAyMun8UMrfxdgoqqsP4 Multisignedadress:0x9F0Bc5D2DAFa22a8D1A496476D9abF4A7e3C2090 Symbol:eth Index:0 Txhash:0x5496614bbea29b2e91a90a285f809e9960e64f4ebe7c9ce2dd7c6b3384c0618d Amount:10000000000000000 OrderID:efc5b260-e389-48f6-ae8d-197d60ba6ce6 DepositType:10 Memo:memo}]}",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"deposit\",\"attributes\":[{\"key\":\"sender\",\"value\":\"BHj2wujKtAxw9XZMA7zDDvjGqKjoYUdw1FZ\"},{\"key\":\"recipient\",\"value\":\"HBCNanXfwZxZpTBTJAyMun8UMrfxdgoqqsP4\"},{\"key\":\"symbol\",\"value\":\"eth\"},{\"key\":\"hash\",\"value\":\"0x5496614bbea29b2e91a90a285f809e9960e64f4ebe7c9ce2dd7c6b3384c0618d\"},{\"key\":\"amount\",\"value\":\"10000000000000000\"},{\"key\":\"index\",\"value\":\"0\"},{\"key\":\"memo\",\"value\":\"memo\"}]},{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"deposit\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true

    }
  ]
}
```

### mint
#### Query the parameters of mint
```bash
hbtccli query mint params
```
##### Example
```bash
hbtccli query mint params
```

##### Success response
```json
{
  "mint_denom": "hbc",
  "inflation": "0.030000000000000000",
  "mint_per_block": "60000000000000000"
}
```


### token
#### Query all supported token symbols
```bash
hbtccli query token symbols
```

##### Example
```bash
hbtccli query token symbols
```
##### Success response

```json
[
  "btc",
  "eth",
  "hbc",
  "tusdt"
]
```
#### Query all supported tokens
```bash
hbtccli query token tokens
```

##### Example
```bash
hbtccli query token tokens
```
##### Success response

```json
[
  {
    "symbol": "btc",
    "issuer": "",
    "chain": "btc",
    "type": "1",
    "is_send_enabled": true,
    "is_deposit_enabled": true,
    "is_withdrawal_enabled": true,
    "decimals": "8",
    "total_supply": "21000000000000000",
    "collect_threshold": "20000",
    "deposit_threshold": "20000",
    "open_fee": "28000000000000000000",
    "sys_open_fee": "28000000000000000000",
    "withdrawal_fee": "3000",
    "max_op_cu_number": "6",
    "sys_transfer_amount": "0",
    "op_cu_sys_transfer_amount": "0",
    "gas_limit": "1",
    "gas_price": "1000"
  },
  {
    "symbol": "eth",
    "issuer": "",
    "chain": "eth",
    "type": "2",
    "is_send_enabled": true,
    "is_deposit_enabled": true,
    "is_withdrawal_enabled": true,
    "decimals": "18",
    "total_supply": "0",
    "collect_threshold": "100000000000000000",
    "deposit_threshold": "100000000000000000",
    "open_fee": "28000000000000000000",
    "sys_open_fee": "28000000000000000000",
    "withdrawal_fee": "8000000000000000",
    "max_op_cu_number": "6",
    "sys_transfer_amount": "0",
    "op_cu_sys_transfer_amount": "0",
    "gas_limit": "21000",
    "gas_price": "1000"
  },
  {
    "symbol": "hbc",
    "issuer": "",
    "chain": "hbc",
    "type": "2",
    "is_send_enabled": true,
    "is_deposit_enabled": false,
    "is_withdrawal_enabled": false,
    "decimals": "18",
    "total_supply": "0",
    "collect_threshold": "0",
    "deposit_threshold": "0",
    "open_fee": "0",
    "sys_open_fee": "0",
    "withdrawal_fee": "0",
    "max_op_cu_number": "0",
    "sys_transfer_amount": "0",
    "op_cu_sys_transfer_amount": "0",
    "gas_limit": "1000000",
    "gas_price": "1"
  }

]
```

#### Query a specific token
```bash
hbtccli query token token [symbol] 
```

##### Example
```bash
hbtccli query token token tusdt 
```
##### Example

```json
{
  "symbol": "tusdt",
  "issuer": "0xC9476A4919a7E5c7e1760b68F945971769D5c1D8",
  "chain": "eth",
  "type": "2",
  "is_send_enabled": true,
  "is_deposit_enabled": true,
  "is_withdrawal_enabled": true,
  "decimals": "6",
  "total_supply": "30000000000000000",
  "collect_threshold": "50000000",
  "deposit_threshold": "50000000",
  "open_fee": "28000000000000000000",
  "sys_open_fee": "28000000000000000000",
  "withdrawal_fee": "20000000000000000",
  "max_op_cu_number": "6",
  "sys_transfer_amount": "8000000000000000",
  "op_cu_sys_transfer_amount": "100000000000000000",
  "gas_limit": "80000",
  "gas_price": "1000"
}                                                      
```

#### Query the precision of a particular token
```bash
hbtccli query token decimal [symbol] 
```

##### Example
```bash
hbtccli query token decimal tusdt 
```
##### uccess response

```json
{
  "decimals": "6"
}                                                    
```


#### Query the parameters of a module 
```bash
hbtccli query token params 
```

##### Example
```bash
hbtccli query token params
```
##### Success response

```json
{
  "token_cache_size": "32",
  "reserved_symbols": [
    "eos",
    "usdt",
    "bch",
    "bsv",
    "ltc",
    "bnb",
    "xrp",
    "okb",
    "ht",
    "dash",
    "etc",
    "neo",
    "atom",
    "zec",
    "ont",
    "doge",
    "tusd",
    "bat",
    "qtum",
    "vsys",
    "iost",
    "dcr",
    "zrx",
    "beam",
    "grin"
  ]
}                                                   
```

### order

Some transactions sent on chain will generate orders, for example keygen(create asset address), deposit,withdrawal etc. Order details can be queried based on the order ID returned by the transaction.

```bash
hbtccli query order order 3b16978a-a435-4b64-acc3-7e15b571319b 
```
##### Success response
```json
{
  "type": "hbtcchain/order/OrderKeyGen",
  "value": {
    "OrderBase": {
      "cu_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
      "id": "3b16978a-a435-4b64-acc3-7e15b571319b",
      "order_type": "1",
      "symbol": "btc",
      "status": "10"
    },
    "key_nodes": [
      "HBCjN2VxLCBMbFKafhjVa8auudMpTpmDgeE8",
      "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
      "HBCVtF1oamkwbczjt5R3mY8j64ZSx9tJqDgL",
      "HBCa7p52Zr1ZVj52Ldc5uFpEMDP6PhzbtxrN"
    ],
    "sign_threshold": "3",
    "to": "HBCNanXfwZxZpTBTJAyMun8UMrfxdgoqqsP4",
    "open_fee": [
      {
        "denom": "hbc",
        "amount": "28000000000000000000"
      }
    ],
    "multi_sign_address": "mwW98DAVfoojM7fkn1RW871PdjBZh7qF6L"
  }
}
```

### Supply

#### Query the supply of the tokens issued
```bash
hbtccli query supply total
```

##### Example
```bash
hbtccli query supply total
```

##### Success response
```json
[
  {
    "denom": "hbc",
    "amount": "3010000000060289755874971480550"
  }
]
```


### gov 
#### Query all parameters of the gov module
```bash
hbtccli query gov params
```
##### Example
```bash
hbtccli query gov params
```
##### Success response
```json
{
  "voting_params": {
    "voting_period": "172800000000000"
  },
  "tally_params": {
    "quorum": "0.334000000000000000",
    "threshold": "0.500000000000000000",
    "veto": "0.334000000000000000"
  },
  "deposit_params": {
    "min_init_deposit": [
      {
        "denom": "hbc",
        "amount": "100000000000000000000000"
      }
    ],
    "min_deposit": [
      {
        "denom": "hbc",
        "amount": "10000000000000000000000000"
      }
    ],
    "max_deposit_period": "172800000000000"
  }
}
```


#### Query the parameters of the gov module for pledge and vote, etc
```bash
hbtccli query gov param [voting/tallying/deposit]
```

##### Example
```bash
hbtccli  query gov param deposit
```
##### Success response
```json
{
  "min_init_deposit": [
    {
      "denom": "hbc",
      "amount": "100000000000000000000000"
    }
  ],
  "min_deposit": [
    {
      "denom": "hbc",
      "amount": "10000000000000000000000000"
    }
  ],
  "max_deposit_period": "180000000000"
}
```

#### Query a specified proposal
Query the exact content of a proposal based on its proposal ID
```bash
hbtccli query gov proposal [proposal-id] [flags]
```
##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

```bash
hbtccli query gov proposal 1
```
##### Success response
```json
{
  "content": {
    "type": "hbtcchain/TextProposal",
    "value": {
      "title": "Test Proposal Title",
      "description": "Test Proposal Contents"
    }
  },
  "id": "1",
  "proposal_status": "DepositPeriod",
  "final_tally_result": {
    "yes": "0",
    "abstain": "0",
    "no": "0",
    "no_with_veto": "0"
  },
  "submit_time": "2020-03-12T15:19:32.4261328Z",
  "deposit_end_time": "2020-03-14T15:19:32.4261328Z",
  "total_deposit": [
    {
      "denom": "hbc",
      "amount": "100000000000000000000000"
    }
  ],
  "voting_start_time": "0001-01-01T00:00:00Z",
  "voting_end_time": "0001-01-01T00:00:00Z"
}
```

#### Query a kind of proposals

```bash
hbtccli query gov proposals  [flags]
```

##### Common query options

| Name        | Type   | Description                                   |
| ----------- | ------ | --------------------------------------------- |
| --depositor | string | Query proposal on depositor's assets pledging |
| --voter     | string | Proposals voted                               |
| --status    | string | Current status of proposals                   |

##### Example

```bash
hbtccli query gov proposals --depositor $(hbtccli keys show -a alice)
hbtccli query gov proposals --voter $(hbtccli keys show -a alice)
hbtccli query gov proposals --status (DepositPeriod|VotingPeriod|Passed|Rejected)
```

#### Query the pledge information of a voter by proposal id

```bash
hbtccli query gov deposit [proposal-id] [depositor-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description              |
| -------------- | ------ | ------------------------ |
| proposal-id    | string | proposal id              |
| depositor-addr | string | The address of depositor |

##### Example

```bash
hbtccli query gov deposit 1 $(hbtccli keys show -a alice)
```

##### Success response
```json
{
  "proposal_id": "1",
  "depositor": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "amount": [
    {
      "denom": "hbc",
      "amount": "10100000000000000000000000"
    }
  ]
}
```

#### Query all pledge information for a proposal

```bash
hbtccli query gov deposits [proposal-id][flags]
```

##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

```bash
hbtccli query gov deposits 1 
```

##### Success response
```json
{
  "proposal_id": "1",
  "depositor": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "amount": [
    {
      "denom": "hbc",
      "amount": "10100000000000000000000000"
    }
  ]
}
```


#### Query a voter's vote on a proposal
```bash
hbtccli query gov vote [proposal-id] [voter-addr] [flags]
```
##### Description of parameters

| Name           | Type   | Description              |
| -------------- | ------ | ------------------------ |
| proposal-id    | string | proposal id              |
| depositor-addr | string | The address of depositor |

##### Example

```bash
hbtccli query gov vote 1 $(hbtccli keys show -a alice)
```
##### Success response
```json
{
  "proposal_id": "1",
  "voter": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "option": "Yes"
}
```

#### Query all voting information for a proposal

```bash
hbtccli query gov votes [proposal-id] [flags]
```

##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

```bash
hbtccli query gov votes 1 
```
##### Success response
```json
[
  {
    "proposal_id": "1",
    "voter": "HBCjN2VxLCBMbFKafhjVa8auudMpTpmDgeE8",
    "option": "No"
  },
  {
    "proposal_id": "1",
    "voter": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "option": "Yes"
  }
]
```



#### Query the proposal initiator 

```bash
hbtccli query gov proposer [proposal-id] [flags]
```

##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

```bash
hbtccli query gov proposer 1
```

##### success response
```json
{
  "proposal_id": "1",
  "proposer": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg"
}
```


#### Query the voting results of a proposal
```bash
hbtccli query gov tally [proposal-id] [flags] 
```

##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

```bash
hbtccli query gov tally 1
```

##### Success response
```json
{
  "yes": "0",
  "abstain": "0",
  "no": "0",
  "no_with_veto": "0"
}
```

### staking

#### Query parameters of the staking module

```bash
hbtccli query staking params
```

##### Example
```bash
hbtccli query staking params
```

##### Success response
```json
{
  "unbonding_time": "1814400000000000",
  "max_validators": 100,
  "max_entries": 7,
  "bond_denom": "hbc",
  "MinSelfDelegation": "5000000000000000000000000"
}
```

#### Query all validators
```bash
hbtccli query staking validators
```
##### Example
```bash
hbtccli query staking validators
```
##### Success response
```json
[
  {
    "operator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "consensus_pubkey": "hbcvalconspub1zcjduepq5r69dmml89q7l8thjkjxh0e0pj6efze4u99pt088373cu05lym4qf6f6v0",
    "jailed": false,
    "status": 2,
    "tokens": "50000000000000000000000000",
    "delegator_shares": "50000000000000000000000000.000000000000000000",
    "description": {
      "moniker": "moniker",
      "identity": "",
      "website": "",
      "details": ""
    },
    "unbonding_height": "0",
    "unbonding_time": "1970-01-01T00:00:00Z",
    "commission": {
      "commission_rates": {
        "rate": "0.100000000000000000",
        "max_rate": "0.200000000000000000",
        "max_change_rate": "0.010000000000000000"
      },
      "update_time": "2020-04-14T06:43:46.28981Z"
    },
    "min_self_delegation": "50000000000000000000000000"
  }

]
```



#### Query a validator

```bash
hbtccli query staking validator [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query staking validator hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response

```json
{
  "operator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
  "consensus_pubkey": "hbcvalconspub1zcjduepq5r69dmml89q7l8thjkjxh0e0pj6efze4u99pt088373cu05lym4qf6f6v0",
  "jailed": false,
  "status": 2,
  "tokens": "50000000000000000000000000",
  "delegator_shares": "50000000000000000000000000.000000000000000000",
  "description": {
    "moniker": "moniker",
    "identity": "",
    "website": "",
    "details": ""
  },
  "unbonding_height": "0",
  "unbonding_time": "1970-01-01T00:00:00Z",
  "commission": {
    "commission_rates": {
      "rate": "0.100000000000000000",
      "max_rate": "0.200000000000000000",
      "max_change_rate": "0.010000000000000000"
    },
    "update_time": "2020-04-14T06:43:46.28981Z"
  },
  "min_self_delegation": "50000000000000000000000000"
}
```



#### Query stakes from a delegator to a validator

```bash
hbtccli query staking delegation [delegator-addr] [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| delegator-addr | string | The delegator address that starts with HBC        |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query staking delegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### Success response
```json
{
  "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
  "shares": "120000000000000000000.000000000000000000",
  "balance": "120000000000000000000"
}
```

#### Query all stakes that a delegtor pledged 
```bash
hbtccli query staking delegations [delegator-addr] [flags]
```

##### 

##### Description of parameters

| Name           | Type   | Description                                |
| -------------- | ------ | ------------------------------------------ |
| delegator-addr | string | The delegator address that starts with HBC |

##### Example

```bash
hbtccli query staking delegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```

##### Success response
```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_address": "hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z",
    "shares": "50000000000000000000.000000000000000000",
    "balance": "50000000000000000000"
  },
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "shares": "120000000000000000000.000000000000000000",
    "balance": "120000000000000000000"
  }
]
```

#### Query the unlocking stakes that a delegator has pledged to a validator

```bash
hbtccli query staking unbonding-delegation [delegator-addr] [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| delegator-addr | string | The delegator address that starts with HBC        |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query staking unbonding-delegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response
```json
{
  "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
  "entries": [
    {
      "creation_height": "5300",
      "completion_time": "2020-04-14T08:23:33.8255297Z",
      "initial_balance": "30000000000000000000",
      "balance": "30000000000000000000"
    }
  ]
}
```


#### 
#### Query the unlocking pledges of a delegtor

```bash
hbtccli query staking unbonding-delegations [delegator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                |
| -------------- | ------ | ------------------------------------------ |
| delegator-addr | string | The delegator address that starts with BHC |

##### Example

```bash
hbtccli query staking unbonding-delegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```

##### Success response

```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
     "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
     "entries": [
       {
         "creation_height": "5300",
         "completion_time": "2020-04-14T08:23:33.8255297Z",
         "initial_balance": "30000000000000000000",
         "balance": "30000000000000000000"
       }
     ]
  }
]
```

#### Query the stakes of a delegtor redeleagte

```bash
hbtccli query staking redelegation [delegator-addr] [src-validator-addr] [dst-validator-addr] [flags]
```

##### Description of parameters

| Name               | Type   | Description                                                  |
| ------------------ | ------ | ------------------------------------------------------------ |
| delegator-addr     | string | The delegator address that starts with HBC                   |
| src-validator-add  | string | The source validator address that starts with hbcvaloper     |
| dst-validator-addr | string | The destination validator address that starts with hbcvaloper |

##### Example

```bash
query staking redelegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z
```

##### Success response
```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_src_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "validator_dst_address": "hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z",
    "entries": [
      {
        "creation_height": 5891,
        "completion_time": "2020-04-14T08:19:58.6984724Z",
        "initial_balance": "50000000000000000000",
        "shares_dst": "50000000000000000000.000000000000000000",
        "balance": "50000000000000000000"
      }
    ]
  }
]
```

#### Query all stakes that a delegtor redelegated

```bash
hbtccli query staking redelegations
```

##### Example

```bash
hbtccli query staking redelegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```

##### Success response

```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_src_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "validator_dst_address": "hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z",
    "entries": [
      {
        "creation_height": 5891,
        "completion_time": "2020-04-14T08:19:58.6984724Z",
        "initial_balance": "50000000000000000000",
        "shares_dst": "50000000000000000000.000000000000000000",
        "balance": "50000000000000000000"
      }
    ]
  }
]
```

#### Query all stakes that a validator received

```bash
  hbtccli query staking delegations-to [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
 hbtccli query staking delegations-to hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response

```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "shares": "120000000000000000000.000000000000000000",
    "balance": "120000000000000000000"
  },
  {
    "delegator_address": "BHj2wujKtAxw9XZMA7zDDvjGqKjoYUdw1FZ",
    "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "shares": "100000000000000000000000000.000000000000000000",
    "balance": "100000000000000000000000000"
  }
]
```

#### Query all pledges from one validator redelegate to other validators

```bash
hbtccli query staking redelegations-from [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query staking redelegations-from hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response

```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_src_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "validator_dst_address": "hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z",
    "entries": [
      {
        "creation_height": 5891,
        "completion_time": "2020-04-14T08:19:58.6984724Z",
        "initial_balance": "50000000000000000000",
        "shares_dst": "50000000000000000000.000000000000000000",
        "balance": "50000000000000000000"
      }
    ]
  }
]
```

#### Query the unlocking pledge of a validator

```bash
hbtccli query staking unbonding-delegations-from [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| validator-addr | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query staking unbonding-delegations-from hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response

```json
[
  {
    "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
    "entries": [
      {
        "creation_height": "5931",
        "completion_time": "2020-04-03T08:23:33.8255297Z",
        "initial_balance": "30000000000000000000",
        "balance": "30000000000000000000"
      }
    ]
  }
]
```

#### Query the balance in the staking pool

```bash
$hbtccli query staking pool
```

##### Example

```bash
$hbtccli query staking pool
```

##### Success response

```json
{
  "not_bonded_tokens": "30000000000000000000",
  "bonded_tokens": "400000170000000000000000000"
}
```

### distribution

#### Query the parameters of distribution

```bash
hbtccli query distribution params
```

##### Example

```bash
hbtccli query distribution params
```

##### Success response

```json
{
  "community_tax": "0.020000000000000000",
  "base_proposer_reward": "0.010000000000000000",
  "bonus_proposer_reward": "0.040000000000000000",
  "withdraw_addr_enabled": true
}
```

#### Query validator-outstanding-rewards

```bash
hbtccli query distribution validator-outstanding-rewards [validator] [flags]
```

##### Description of parameters

| Name      | Type   | Description                                       |
| --------- | ------ | ------------------------------------------------- |
| validator | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query distribution validator-outstanding-rewards hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### Success response
```json
[
  {
    "denom": "hbc",
    "amount": "2660287954396406984212.455000000000000000"
  }
]
```

#### Query the commisssion of a validator

```bash
 hbtccli query distribution commission [validator] [flags]
```

##### Description of parameters

| Name      | Type   | Description                                       |
| --------- | ------ | ------------------------------------------------- |
| validator | string | The validator address that starts with hbcvaloper |

##### Example

```bash
hbtccli query distribution commission hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### Success response

```json
null
```
NOTE: Several validators commission is currently set to 0

#### Query the validator's slashes

```bash
hbtccli query distribution slashes [validator] [start-height] [end-height] [flags]
```

##### Description of parameters

| Name         | Type   | Description                                       |
| ------------ | ------ | ------------------------------------------------- |
| validator    | string | The validator address that starts with hbcvaloper |
| start-height | string | start hegiht                                      |
| end-height   | string | end hegiht                                        |

##### Example

```bash
hbtccli query distribution slashes hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun 0 100
```

##### Success response
```json
null
```

#### Query the validator's rewards

```bash
hbtccli query distribution rewards [delegator-addr] [<validator-addr>] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                                 |
| -------------- | ------ | ----------------------------------------------------------- |
| delegator-addr | string | The delegator address that starts with HBC                  |
| validator-addr | string | The validator address that starts with hbcvaloper, optional |

##### Example

```bash
hbtccli query distribution rewards HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### Success response
```json
[
  {
    "denom": "hbc",
    "amount": "962401463225280.000000000000000000"
  }
]
```

#### Query community-pool

```bash
hbtccli query distribution community-pool
```

##### Example

```bash
hbtccli query distribution community-pool
```

##### Success response

```json
[
  {
    "denom": "hbc",
    "amount": "219939930488250056843.400000000000000000"
  }
]
```

### slashing

#### Query the parameters of slashing

```bash
hbtccli query slashing params
```

##### Example

```bash
hbtccli query slashing params
```

##### Success response

```json
{
  "max_evidence_age": "120000000000",
  "signed_blocks_window": "100",
  "min_signed_per_window": "0.500000000000000000",
  "downtime_jail_duration": "600000000000",
  "slash_fraction_double_sign": "0.050000000000000000",
  "slash_fraction_downtime": "0.010000000000000000"
}
```

#### Query a validator's signing information

```bash
hbtccli query slashing signing-info [validator-conspub] [flags]
```

##### Description of parameters

| Name              | Type   | Description                                             |
| ----------------- | ------ | ------------------------------------------------------- |
| validator-conspub | string | The validator public key that starts with hbcvalconspub |

##### Example

```bash
hbtccli query slashing signing-info hbcvalconspub1zcjduepq69plcv4nzg27qashf328q0p6uc8cdpl4u3fz5sd2ugz34nk0u4ws2zrp0f
```
##### Success response

```json
{
  "address": "hbcvalcons1h0muy2683gyp6ra2qph9hxwdfmxzw6x4xtkm8m",
  "start_height": "0",
  "index_offset": "8606",
  "jailed_until": "1970-01-01T00:00:00Z",
  "tombstoned": false,
  "missed_blocks_counter": "0"
}
```
### hrc20
#### Query the parameters of hrc20 module

```bash
hbtccli query hrc20 params
```

##### Example

```bash
hbtccli query hrc20 params
```

##### Success response

```json
{
  "issue_token_fee": "10000000000000000000000"
}
```

### cu
#### Query for a cu information

```bash
hbtccli query cu cuinfo [cu_addr][flags]
```

##### Description of parameters

| Name    | Type   | Description                                      |
| ------- | ------ | ------------------------------------------------ |
| cu-addr | string | The custodian unit address which starts with HBC |

##### Example

```bash
hbtccli query cu cuinfo $(hbtccli keys show -a alice)
```
##### Success response
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "cu_type": "1",
    "address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "public_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "AwvzJMjkXTRO9jmkEHiLi/2BHpwLuAR+SohLW2t3vwe/"
    },
    "sequence": "8",
    "coins": [
      {
        "denom": "hbc",
        "amount": "299999974110000000000000000"
      },
      {
        "denom": "eth",
        "amount": "17800000000000000"
      }
    ],
    "coins_hold": [
      {
        "denom": "eth",
        "amount": "2200000000000000"
      }
    ],
    "assets": [
      {
        "denom": "eth",
        "address": "0x0B2dE9E53f794A51D133afae5cF6142DA4130Fb3",
        "enbale_sendtx": false
      }
    ],
    "asset_coins": [
      {
        "denom": "eth",
        "amount": "20000000000000000"
      }
    ],
    "asset_coins_hold": [],
    "cu_number": "0",
    "asset_pubkey": "Ats0/JuoM9z3VhMGRoUGoxXiZ+Uc9NUooVg+FtJL+Hrf",
    "gas_used": [],
    "gas_received": []
  }
}
```

#### Query the amount of a token of a cu

```bash
hbtccli query cu cucoin [cu_addr][symbol]
```

##### Description of parameters

| Name    | Type   | Description                                      |
| ------- | ------ | ------------------------------------------------ |
| cu-addr | string | The custodian unit address which starts with HBC |
| symbol  | string | The token name                                   |

##### Example

```bash
hbtccli query cu cucoin $(hbtccli keys show -a alice) eth
```
##### Success response
```json
{
  "type": "hbtcchain/CUCoin",
  "value": {
    "address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "denom": "eth",
    "amount": "17800000000000000",
    "amount_hold": "2200000000000000",
    "ext_amount": "20000000000000000",
    "ext_amount_hold": "0"
  }
}
```

#### Query the opcu information for a token

```bash
hbtccli query cu op [symbol]
```

##### Description of parameters

| Name   | Type   | Description         |
| ------ | ------ | ------------------- |
| symbol | string | The symbol of token |

##### Example

```bash
hbtccli query cu eth
```

##### Success response

```

```

### mapping

for query the information of the asset mapping module

#### Query the mapping contract of a token

```bash
hbtccli query mapping info [issue-symbol]
```
##### Description of parameters

| Name         | Type   | Description                                                 |
| ------------ | ------ | ----------------------------------------------------------- |
| issue-symbol | string | The token symbol of an asset mapping contract to be queried |

##### Description of response

| Name          | Type   | Description                                                  |
| ------------- | ------ | ------------------------------------------------------------ |
| issue_symbol  | string | The token symbol of an asset mapping contract                |
| target_symbol | string | The target token symbol of an asset mapping contract         |
| total_supply  | string | Total supply of the issued tokens, in line with the total supply of the mapped target token |
| issue_pool    | string | Remaining tokens in the issue-pool, total_supply - issue-pool is the total number of tokens issued |
| enabled       | bool   | Whether issuance and exchange are permitted                  |

##### Example

```bash
hbtccli query mapping info cbtc
```
##### ccess response
```json
{
  "issue_symbol": "cbtc",
  "target_symbol": "btc",
  "total_supply": "2100000000000000",
  "issue_pool": "2099999999876644",
  "enabled":true
}
```

#### Query all asset mapping contracts

```bash
hbtccli query mapping list
```

##### Returned value description

Return an array of all asset mapping contracts, with each item referring to the previous section

##### Example

```bash
hbtccli query mapping list
```

##### Success response

```json
[{
  "issue_symbol": "cbtc",
  "target_symbol": "btc",
  "total_supply": "2100000000000000",
  "issue_pool": "2099999999876644",
  "enabled":true
}]
```

## tx
### keygen
#### Create operation custodian unit (OPCU)

```bash
hbtccli tx keygen newopcu [from_key_or_address] [symbol] [Op_CU_address]
```

##### Description of parameters

| Name                | Type   | Description                               |
| ------------------- | ------ | ----------------------------------------- |
| from_key_or_address | string | the newopcu transaction initiator address |
| symbol              | string | Symbol of the token                       |
| to                  | string | OPCU address                              |

##### Example

Create an eth operations custodian unit with the address HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo, which must be an unused address

```bash
hbtccli tx keygen newopcu HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg eth HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc --home ../testnetdocker/node0/hbtccli
```
##### Success response
```bash
{
  "chain_id": "hbtc-testnet",
  "cu_number": "0",
  "sequence": "664",
  "fee": {
    "amount": [
      {
        "denom": "hbc",
        "amount": "200000000000000000"
      }
    ],
    "gas": "200000"
  },
  "msgs": [
    {
      "type": "hbtcchain/keygen/MsgNewOpCU",
      "value": {
        "Symbol": "eth",
        "From": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
        "OpCUAddress": "HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo"
      }
    }
  ],
  "memo": ""
}

confirm transaction before signing and broadcasting [y/N]: y
Password to sign with 'node0':<input password>
height: 0
txhash: B8FEF2E621686136882ADA19C939D959982D979C13BB51D3ACA29C4C964AC777
code: 0
data: ""
rawlog: '[{"msg_index":0,"success":true,"log":"","events":[{"type":"message","attributes":[{"key":"action","value":"new_op_cu"}]}]}]'
logs:
- msgindex: 0
  success: true
  log: ""
  events:
  - type: message
    attributes:
    - key: action
      value: new_op_cu
info: ""
gaswanted: 0
gasused: 0
codespace: ""
tx: null
timestamp: ""
events: []
```

#### Generate token addresses for the custodian unit (CU)

```
keygen [from_key_or_address] [symbol] [to]
```

##### Description of parameters

| Name                | Type   | Description                                     |
| ------------------- | ------ | ----------------------------------------------- |
| from_key_or_address | string | The initiator address of the keygen transaction |
| symbol              | string | The symol of token                              |
| to                  | string | Owner of the created token address              |

##### Example

generates an eth address for HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo 
```bash
hbtccli tx keygen keygen HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg eth HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc --home ../testnetdocker/node0/hbtccli
```
##### Success response
```bash
{
  "chain_id": "hbtc-testnet",
  "cu_number": "0",
  "sequence": "603",
  "fee": {
    "amount": [
      {
        "denom": "hbc",
        "amount": "200000000000000000"
      }
    ],
    "gas": "200000"
  },
  "msgs": [
    {
      "type": "hbtcchain/keygen/MsgKeyGen",
      "value": {
        "OrderId": "8aa29c69-2cd4-4dde-bb5c-273757bfdd6e",
        "Symbol": "eth",
        "From": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
        "To": "HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo"
      }
    }
  ],
  "memo": ""
}

confirm transaction before signing and broadcasting [y/N]: y
Password to sign with 'node0':<input password>
height: 0
txhash: 4ABC263EFFAC364ED966EE4654ADEC050D6A1C2886B229CE13556010111531E9
code: 4
data: ""
rawlog: '{"codespace":"hbtcchain_base\","code":4,"message":"signature verification failed;
  verify correct CU sequence and chain-id"}'
logs: []
info: ""
gaswanted: 0
gasused: 0
codespace: ""
tx: null
timestamp: ""
events: []
```

### gov
#### Initiate a text proposal
```bash
hbtccli tx gov submit-proposal --title="Test Proposal Title" --description="Test Proposal Contents" --type="Text" --deposit="10hbc" --from mykey --gas-prices 1000000000000.0hbc
```
Or
```bash
hbtccli tx gov submit-proposal --proposal="path/to/proposal.json" --from mykey --gas-prices 1000000000000.0hbc
```

##### Description of parameters

| Name        | Type   | Description                                   |
| ----------- | ------ | --------------------------------------------- |
| title       | string | The proposal title                            |
| description | string | The proposal content                          |
| type        | string | The type of proposal (specified here as Text) |
| from        | string | The originator of the proposal                |

##### Example

```bash
hbtccli tx gov submit-proposal --title="Test Proposal Title" --description="Test Proposal Contents" --type="Text" --deposit="100000000000000000000000hbc" --from alice --gas-prices 1000000000000.0hbc
```

##### Success response
```json
{
  "height": "0",
  "txhash": "0CC5E052CBCEDE6167BEF4B818C2D728D52857C0C9514211BD389FCAD1723F03",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Launch a proposal on change parameters

```bash
tx gov submit-proposal param-change <path/to/proposal.json> --from=<key_or_address>
```

##### Example

```bash
hbtccli tx gov submit-proposal param-change staking_params_change.json --from alice
```

##### Success response

```json
{
  "height": "0",
  "txhash": "1F065ACEB801774009F276623F241B5071222700F607015BAC2FCCC7D41C049F",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```


#### Initiate a community-pool-spend proposal
```bash
tx gov submit-proposal community-pool-spend <path/to/proposal.json> --from=<key_or_address>
```

##### Example
```bash
hbtccli tx gov submit-proposal community-pool-spend community_pool_spend.json --from alice
```
##### Success response
```json
{
  "height": "0",
  "txhash": "1997BF6C8894CA067489367B2068F6A6CF31D73CF9BC7C2FB499E544B3573490",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```



#### Initiate a voting proposal to add a new token

```bash
tx gov submit-proposal add-token <path/to/proposal.json> --from=<key_or_address>
```

##### Example

```bash
hbtccli tx gov submit-proposal add-token add_token_proposal.json --from alice
```

##### Success response

```json
{
  "height": "0",
  "txhash": "CB3D975A6F6E8A77BAD7C0E6A4C6501E37E22A3BFF8960728039163217FC59CC",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Initiate a proposal to change a token's parameters

```bash
tx gov submit-proposal token-params-change <path/to/proposal.json> --from=<key_or_address>
```

##### Example

```bash
hbtccli tx gov submit-proposal token-params-change token_params_change_proposal.json --from alice
```

##### Success response

```json
{
  "height": "0",
  "txhash": "BF91334DE36B2A5AAE41BC9A386CDDA89267D37C1B55692150C7AA11F4FB11A1",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Initiate  a voting proposal to delist a token

```bash
tx gov submit-proposal disable-token <path/to/proposal.json> --from=<key_or_address>
```

##### Example

```bash
hbtccli tx gov submit-proposal disable-token disable_token_proposal.json --from alice
```

##### Success response

```json
{
  "height": "0",
  "txhash": "39C6730F288E515D02B5B233A8022E51C56A54C807BB2BC9E4A5DB4657A17CB7",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"submit_proposal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "submit_proposal"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Pledge funds for a proposal

```bash
hbtccli tx gov deposit [proposal-id] [amount]
```

##### Description of parameters

| Name        | Type   | Description       |
| ----------- | ------ | ----------------- |
| proposal-id | string | proposal id       |
| amount      | string | The deposit funds |

##### Example

```bash
hbtccli tx gov deposit 1 10000000000000000000000000hbc --gas-prices 1000000000000.0hbc --from alice
```
##### Success response
```json
{
  "height": "0",
  "txhash": "83729758C6E2986772AED8CFB244B7954CF1EA5C044577101226A0EBFDCC4E68",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"deposit\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "deposit"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Voting on a proposal

```bash
hbtccli tx gov vote [proposal-id] [option] [flags]
```

##### Description of parameters

| Name        | Type   | Description                               |
| ----------- | ------ | ----------------------------------------- |
| proposal-id | string | proposal id                               |
| options     | string | Voting options, yes/no/abstain/nowithveto |

##### Example

```bash
hbtccli tx gov vote 1 yes --from alice --gas-prices 1000000000000.0hbc
```

##### Success response

```bash
hbtccli tx gov vote 1 yes --from alice --gas-prices 1000000000000.0hbc
```
##### 成功返回
```json
{
  "height": "0",
  "txhash": "479517D2CDC084C0393DD4E9DB2B7FDDD6A1E9C166EAF893ABAB089B27A8F667",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"vote\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "vote"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Vote for DAO proposal

DAO proposal is the voting proposal for a certain token, which a certain amount of the tokens will be locked after voting, while be returned after voting cancelled or finished. 

```bash
hbtccli tx gov daovote [proposal-id] [coin] [option] [flags]
```

##### Description of parameters

| Name        | Type   | Description                        |
| ----------- | ------ | ---------------------------------- |
| proposal-id | string | proposal id                        |
| coin        | string | To ken amount                      |
| options     | string | Options: yes/no/abstain/nowithveto |

##### Example

Use hdt token to vote 3000 "yes" to Proposal 1.

```bash
hbtccli tx gov daovote 1 3000hdt yes --from alice --gas-prices 1000000000000.0hbc
```

#### Cancel DAO Voting

```bash
hbtccli tx gov canceldaovote [proposal-id] [flags]
```

##### Description of parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| proposal-id | string | proposal id |

##### Example

Cancel DAO votes to Proposal 1.

```bash
hbtccli tx gov canceldaovote 1 --from alice --gas-prices 1000000000000.0hbc
```

### staking

#### Create  validator

 ```bash
 hbtccli tx staking create-validator [flags]
 ```

##### Description of parameters

| Name                       | Type   | Description                                                  |
| -------------------------- | ------ | ------------------------------------------------------------ |
| pubkey                     | string | Public key of the public & private key pair for the signing blocks |
| amount                     | string | Token name and amount pledged                                |
| commission-max-rate        | string | Maximum commission rate                                      |
| commission-rate            | string | Commission rate                                              |
| commission-max-change-rate | string | Maximum modification rate for commission                     |
| min-self-delegation        | string | Minimum self-pledged amount                                  |
| moniker                    | string | Node name                                                    |
| website                    | string | Node website                                                 |
| details                    | string | Node details                                                 |

##### Example

```bash
hbtccli tx staking create-validator --moniker alice --pubkey hbcvalconspub1zcjduepqcwj0py8n8rp5xf56744eydnsd3vpt9auhlste8ex0u863h9hvzesyqv5l8 --amount 100000000000000000000000hbc --commission-max-rate 0 --commission-rate 0 --commission-max-change-rate 0 --min-self-delegation 1000000000000000000 --from node0 --home testnet/node0/hbtccli --from alice --gas-prices 1000000000000.0hbc
```

#### Update validator information

 ```bash
 hbtccli tx staking edit-validator [flags]
 ```

##### Description of parameters

##### Description of parameters

| Name                | Type   | Description                              |
| ------------------- | ------ | ---------------------------------------- |
| description         | string | Node details                             |
| commission-rate     | string | Commission rate                          |
| min-self-delegation | string | Minimum modification rate for commission |
| moniker             | string | Node name                                |
| website             | string | Node website                             |
| details             | string | Node details                             |
| key-node            | bool   | Core nodes or not                        |

##### Example

```bash
hbtccli tx staking edit-validator --key-node true --from alice --gas-prices 1000000000000.0hbc
```

#### Pledge assets to validator

 ```bash
 hbtccli tx staking delegate [validator-addr] [amount] [flags]
 ```

##### Description of parameters

| Name           | Type   | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| validator-addr | string | The validator address that starts with hbcvaloper |
| amount         | string | Token name and amount                             |

##### Example

```bash
hbtccli tx staking delegate hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun  100000000000000000000hbc --from alice --gas-prices 1000000000000.0hbc
```
##### Success response
```json
{
  "height": "0",
  "txhash": "127DE69768E413CDBADB15F3A220DD22FE5D1984F1143D525EBE934A6D4DD171",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"delegate\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "delegate"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Pledge assets from one validator to another validator

 ```bash
hbtccli tx staking redelegate [src-validator-addr] [dst-validator-addr] [amount] [flag]
 ```

##### Description of parameters

| Name               | Type   | Description                                              |
| ------------------ | ------ | -------------------------------------------------------- |
| src-validator-addr | string | The source validator address that begins with hbcvaloper |
| dst-validator-addr | string | The target validator address that starts with hbcvaloper |
| amount             | string | Token name and amount                                    |

##### Example

```bash
hbtccli tx staking redelegate hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z 50000000000000000000hbc --from alice --gas-prices 1000000000000.0hbc
```
##### Success response
```json
{
  "height": "0",
  "txhash": "1B72BF06683454C90E4C956B5AE865F782CF9777B71481CA9211CB92236AA7A1",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_redelegate\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "begin_redelegate"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Cancle the pledge to validator

 ```bash
 hbtccli tx staking unbond [validator-addr] [amount] [flags]
 ```

##### Description of parameters

| Name           | Type   | Description                             |
| -------------- | ------ | --------------------------------------- |
| validator-addr | string | validator address begins withhbcvaloper |
| amount         | string | Token name and amount                   |

##### Example

```bash
hbtccli tx staking unbond hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun 100000000000000000000hbc --from alice --gas-prices 1000000000000.0hbc
```


### distribution

#### Configure the beneficiary address of delegator rewards

```bash
 hbtccli tx distribution set-withdraw-addr [withdraw-addr] [flags]
```

##### Description of parameters

| Name          | Type   | Description                                           |
| ------------- | ------ | ----------------------------------------------------- |
| withdraw-addr | string | Address of beneficiary custodian unit starts with HBC |

##### Example

```bash
 hbtccli tx distribution set-withdraw-addr HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg --from mykey --gas-prices 1000000000000.0hbc

```

##### Success response
```json
{
  "height": "0",
  "txhash": "24476645A437C61A6560E1B3C12A94A21265223AE20649148EA238BD323C84C8",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"set_withdraw_address\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "set_withdraw_address"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Withdrawal pledged rewards from a validator

```bash
hbtccli tx distribution withdraw-rewards [validator-addr] [flags]
```

##### Description of parameters

| Name           | Type   | Description                                     |
| -------------- | ------ | ----------------------------------------------- |
| validator-addr | string | Validator addresses that starts with hbcvaloper |

##### Example

```bash
hbtccli tx distribution withdraw-rewards hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun --from alice --gas-prices 1000000000000.0hbc
```

##### Success response
```json
{
  "height": "0",
  "txhash": "FE63EC4BE20EF947F58C847DF935F6951155F4F9DD1AE519A7F9FBAF6925B7F5",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"withdraw_delegator_reward\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "withdraw_delegator_reward"
            }
          ]
        }
      ]
    }
  ]
}
```
#### To withdraw pledged rewards from all validators

```bash
hbtccli tx distribution withdraw-all-rewards [flags]
```

##### Example

```bash
hbtccli tx distribution withdraw-all-rewards --from alice --gas-prices 1000000000000.0hbc
```

##### Success response

```json
{
  "height": "0",
  "txhash": "E8602B91CC973EBB4369277C18364CFB1663BED3F1E565FFBE19C0D2AE47F7BE",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"withdraw_delegator_reward\"}]}]},{\"msg_index\":1,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"withdraw_delegator_reward\"},{\"key\":\"action\",\"value\":\"withdraw_delegator_reward\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "withdraw_delegator_reward"
            }
          ]
        }
      ]
    },
    {
      "msg_index": 1,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "withdraw_delegator_reward"
            },
            {
              "key": "action",
              "value": "withdraw_delegator_reward"
            }
          ]
        }
      ]
    }
  ]
}
```



### transfer 
####  Internal transfers within HBTC Chain system 

```bash
hbtccli tx transfer send [from] [to][amount][flags]
```

##### Description of the parameters

| Name   | Type   | Description                                                  |
| ------ | ------ | ------------------------------------------------------------ |
| from   | string | The owner of the asset                                       |
| to     | string | The custodian unit address of being transferred to           |
| amount | string | Token name and Amount, use comma to split multiple assets e.g. 100hbc, 2btc |

##### Example

```bash
hbtccli tx transfer send alice  HBCjN2VxLCBMbFKafhjVa8auudMpTpmDgeE8  1000000000000000hbc --chain-id hbtc-testnet  --gas-prices 1000000000000.0hbc
```

#### Success response

```json
{
  "height": "0",
  "txhash": "229673703B6FB3CDE418436B8B7B7C39D13A9B7FA643A77500E0D915A4872DD8",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"new-token\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "new-token"
            }
          ]
        }
      ]
    }
  ]
}
```

#### Deposit the external chain assets into the HBTC Chain

```bash
hbtccli tx transfer deposit [from_key_or_address] [toCU_address] [to_address] [coin] [txhash] [index] [memo] [height] [flags]
```

##### Description of parameters

| Name                | Type   | Description                                                  |
| ------------------- | ------ | ------------------------------------------------------------ |
| from_key_or_address | string | The depositer can be the owner of the toCU or someone else   |
| to_cu               | string | Address of the custodian unit to be deposited                |
| to_address          | string | The external chain address (e.g. BTC/ETH) corresponds to the custodian unit address being deposited |
| amount              | string | Token name and amount                                        |
| hash                | string | External chain transaction hash                              |
| index               | string | External chain transaction index, for utxo type assets, index is the index value in Vout; for account type assets, index = 0 |
| memo                | string | The memo attached to external chain transaction              |
| height              | string | The block height of external chain transaction               |

##### Example

```bash
hbtccli tx transfer deposit alice $(hbtccli keys show -a bob) 0x6537f7fb0064aaa4b5b9f379d24133027155b727 10000000000000000eth 0x228409bb2999911b94f0513f101f3fcf212058b7af18c88c625b41ddf20a0c6b 0 memo 7505327 --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc
```

##### Success response
```bash
{ 
height: 0
txhash: E81EC801B96C99E99BA2EAA73624AF5FAA7A0356894846BB11C70D57B62937AD
code: 0
data: ""
rawlog: '[{"msg_index":0,"success":true,"log":"","events":[{"type":"message","attributes":[{"key":"action","value":"deposit"}]}]}]'
logs:
- msgindex: 0
  success: true
  log: ""
  events:
  - type: message
    attributes:
    - key: action
      value: deposit
info: ""
gaswanted: 0
gasused: 0
codespace: ""
tx: null
timestamp: ""
events: []
}
```



#### Withdraw assets to an external chain address

```bash
hbtccli tx transfer withdrawal [from_key_or_address] [to_address] [amount] [gas] [flags]
```

##### Description of parameters

| Name                | Type   | Description of parameters                                    |
| ------------------- | ------ | ------------------------------------------------------------ |
| from_key_or_address | string | The depositer can be the owner of the toCU or someone else   |
| to_address          | string | The external chain address (e.g. BTC/ETH) corresponds to the custodian unit address being deposited |
| amount              | string | Token name and amount                                        |
| gas                 | string | The gas fee in external chain tokens                         |

##### Example

```bash
hbtccli tx transfer withdrawal --chain-id hbtc-testnet alice  0xc96d141c9110a8E61eD62caaD8A7c858dB15B82c  1200000000000000eth  1000000000000000 --gas-prices 1000000000000.0hbc
```
##### Success response
```json
{
  "height": "0",
  "txhash": "F240EB278D946EA9C1DD999A56E54D8ADD3BE16FA9A93F5CF9BD8DE4DAD179DA",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"withdrawal\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "withdrawal"
            }
          ]
        }
      ]
    }
  ]
}

```

### hrc20
#### One-click coin issuance

On the HBTC chain, the user pays the issuance fee defined in the HRC20 parameter (default is 10000000000000000000000 * POW(10, -18)HBC)

```bash
hbtccli tx hrc20 new-token [to][symbol][decimals][totalSupply] [flags]
```
##### Description of parameters

| Name        | Type   | Description of parameters                                    |
| ----------- | ------ | ------------------------------------------------------------ |
| to          | string | Owner of the asset                                           |
| symbol      | string | The name of the newly issued token, must not conflict with the name of the existing token and reserved token in the token module |
| decimals    | int    | Precision, minimum precision must not exceed 18 bits         |
| totalSupply | int    | Total supply, in minimum precision                           |

##### Example

```bash
hbtccli tx hrc20 new-token $(hbtccli keys show -a alice) mytoken 18 10000000000000000000000000000 --from alice
```

##### Success response

```json
{
  "height": "0",
  "txhash": "229673703B6FB3CDE418436B8B7B7C39D13A9B7FA643A77500E0D915A4872DD8",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"new-token\"}]}]}]",
  "logs": [
    {
      "msg_index": 0,
      "success": true,
      "log": "",
      "events": [
        {
          "type": "message",
          "attributes": [
            {
              "key": "action",
              "value": "new-token"
            }
          ]
        }
      ]
    }
  ]
}
```

### mapping
#### Mapping Issuance and Exchange

Through an asset mapping contract, users can pledge their mapped issuance or exchange their issued tokens and target tokens.

```bash
hbtccli tx mapping swap [issue-symbol] [coins] [flags]
```

##### Description of parameters

| Name         | Type   | Description of parameters                                    |
| ------------ | ------ | ------------------------------------------------------------ |
| issue-symbol | string | Token issued by the asset mapping contract                   |
| coins        | string | Coins that need to be exchanged, must be either the issued token or the targeted token |

##### Example

```bash
# From a CBTC mapping contract, collateralize 50 BTC, and issue 50 CBTC
hbtccli tx mapping swap --chain-id hbtc-testnet cbtc 50btc --from alice
# From a CBTC mapping contract, collateralize 50 CBTC, exchange back to 50 BTC
hbtccli tx mapping swap --chain-id hbtc-testnet cbtc 50cbtc --from alice
```

##### Success response
```json
{
  "height":"322",
  "txhash":"DA166288EEEAFD331C5C4DA8E74F03591AA6349E6D0FF6EB9B2C1F7FD6FDFA51",
  "data":"{Category:9 Flows:[{CUAddress:A8909558F38E0758CAFC0FFE47E396E3F9209F19 Symbol:btc PreviousBalance:123333 BalanceChange:-50 PreviousBalanceOnHold:0 BalanceOnHoldChange:0} {CUAddress:A8909558F38E0758CAFC0FFE47E396E3F9209F19 Symbol:cbtc PreviousBalance:2099999986296176 BalanceChange:50 PreviousBalanceOnHold:0 BalanceOnHoldChange:0} {IssueSymbol:cbtc PreviousIssuePool:2099999999876644 IssuePoolChange:50}]}",
  "raw_log":"[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"mapping-swap\"}]}]}]",
  "logs":[
    {
      "msg_index":0,
      "success":true,
      "log":"",
      "events":[
        {
          "type":"message",
          "attributes":[
            {
              "key":"action",
              "value":"mapping-swap"
            }
          ]
        }
      ]
    }
  ],
  "gas_wanted":"200000",
  "gas_used":"43214",
  "tx":{
    "type":"hbtcchain/StdTx",
    "value":{
      "msg":[
        {
          "type":"hbtcchain/mapping/MsgMappingSwap",
          "value":{
            "from":"HBCbZBHmdhWg191SuYwaCVeco124THfZX1r5",
            "issue_symbol":"cbtc",
            "coins":[
              {
                "denom":"btc",
                "amount":"50"
              }
            ]
          }
        }
      ],
      "fee":{
        "amount":[

        ],
        "gas":"200000"
      },
      "signatures":[
        {
          "pub_key":{
            "type":"tendermint/PubKeySecp256k1",
            "value":"AvVo1DcSSvHMErFKfvcAM+JmJ0RytYGXg9Tlj0Dy7IIY"
          },
          "signature":"1+tLQUE8OWAcAcNAwugTzq9UyTMKF2EBM8Ru6OwygL88HAnAzDmrSEzmiI3n8dWzUJqIIIPbcR6bmktmYWLwOg=="
        }
      ],
      "memo":""
    }
  },
  "timestamp":"2020-04-16T09:47:53Z",
  "events":[
    {
      "type":"message",
      "attributes":[
        {
          "key":"action",
          "value":"mapping-swap"
        }
      ]
    }
  ]
}
```

## rest-server
Start a local rest server

```bash
hbtccli rest-server [flags]
```

| Name         | Type   | flag desc                                                    |
| ------------ | ------ | ------------------------------------------------------------ |
| laddr string | string | The listening address of rest server，(default "tcp://localhost:1317") |
| max-open     | uint   | Max connections                                              |
| node         | string | Node IP and port<host>:<port>，(default "tcp://localhost:26657") |
| trust-node   | string | Trusted connection node                                      |

### Example

```bash
hbtccli rest-server --home node0/hbtccli --chain-id hbtc-testnet --node tcp://127.0.0.1:26657 --trust-node true 
```
### Success response
```
I[2020-03-14|09:18:04.726] Starting application REST service (chain-id: "hbtc-testnet")... module=rest-server
I[2020-03-14|09:18:04.727] Starting RPC HTTP server on 127.0.0.1:1317   module=rest-server
```

## keys

> The local private key is mainly composed of the following commands:
>
> * `hbtccli keys add`     [Add a new key](#add) (#list)
> * `hbtccli keys list`    [List all keys](#list)
> * `hbtccli keys update`  [Update private key](#update)
> * `hbtccli keys delete`  [Delete a private key](#delete)
> * `hbtccli keys import`  [Import private key(s)](#import)
> * `hbtccli keys export`  [Export private key(s)](#export)
>
> > The private key is stored locally in the default location: $HOME/.hbtccli/keys/. Deleting the storage file will empty the local storage of all private keys. The operation of the private key through the `keys` related commands does not affect the account status in the QOS network, please keep the account private key information properly.

### add

`hbtccli keys add <key_name>`

<key_name>can be whatever you want, as a local private key for distinguishing only .

The following command will generate a private key with the name `Alice' into the local private key database:

```bash
$ hbtccli keys add Alice
Enter a passphrase to encrypt your key to disk:<Enter a passphrase>
Repeat the passphrase:<Repeat the passphrase>
NAME:	TYPE:	ADDRESS:						PUBKEY:
- name: alice
  type: local
  address: HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
  pubkey: hbcpub1addwnpepqwkg5c0dvfpz9guv3hegastumkre8e5lh2fvw6kgxhq74vxd97am6kmsnf0
  mnemonic: ""
  threshold: 0
  pubkeys: []


**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your CU if you ever forget your password.

rare nuclear foster thunder wonder core section file utility service quiz correct lion frost piano split aisle weather depth main trumpet lobster fire connect
```
`HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg`is the account address that applies to the QOS network, `hbcpub1addwnpepqwkg5c0dvfpz9guv3hegastumkre8e5lh2fvw6kgxhq74vxd97am6kmsnf0` is an account public key information, `rare nuclear foster thunder wonder core section file utility service quiz correct lion frost piano split aisle weather depth main trumpet lobster fire connect`  are mnemonics that can be used for the private key recovery of an account, please keep them safe.

#### List

`hbtccli keys list`
```bash
$ hbtccli keys list

[
  {
    "name": "alice",
    "type": "local",
    "address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "pubkey": "hbcpub1addwnpepqwkg5c0dvfpz9guv3hegastumkre8e5lh2fvw6kgxhq74vxd97am6kmsnf0"
  },
  {
    "name": "bob",
    "type": "local",
    "address": "HBCjN2VxLCBMbFKafhjVa8auudMpTpmDgeE8",
    "pubkey": "hbcpub1addwnpepqdds5tew3ekhjnjsn0yekl3wralnncek49399yhj79c97d7mzt90zgh3l3f"
  },
  {
    "name": "jack",
    "type": "local",
    "address": "HBCVtF1oamkwbczjt5R3mY8j64ZSx9tJqDgL",
    "pubkey": "hbcpub1addwnpepqdnx9rkxuxmc0g35xxjalhd7wcq8lc40zjs7yra00vjt8h0pphgt62weaw9"
  },
  {
    "name": "tom",
    "type": "local",
    "address": "HBCa7p52Zr1ZVj52Ldc5uFpEMDP6PhzbtxrN",
    "pubkey": "hbcpub1addwnpepq0zu4dz4lrm5g5vy524j94qypeunlyf8u8zxedw3ku6whnskdnyjqe94dce"
  }
]
```

#### 更update

`hbtccli keys update <key_name>`

Update `Alice`'s passphrase:
```bash
hbtccli keys update Alice
Enter the current passphrase:<Enter the current passphrase>
Enter the new passphrase:<Enter the new passphrase>
Repeat the new passphrase:<Repeat the new passphrase>
Password successfully updated!
```

#### Export

`hbtccli keys export <key_name>`

Export `Alice`'s private key:

```bash
hbtccli keys export Alice
Enter passphrase to decrypt your key:<enter current password>
Enter passphrase to encrypt the exported key:enter your password>
-----BEGIN TENDERMINT PRIVATE KEY-----
salt: A6528A0F9D47D2A8E949037D27A4BDD8
kdf: bcrypt

3DgFM6oCq7DWwxxjkzEvk3M53y3UnP5g3cAEFR7oYwvibG6+XBbdhncX1vKFeK/m
79ofswcWI/VRuzxg9s+NXwnRYUFU4tLYPYI58FA=
=JCP8
-----END TENDERMINT PRIVATE KEY-----
```

#### Delete

`hbtccli keys delete <key_name>`

Delete the private key info of `Alice`:
```bash
$ hbtccli keys delete alice
DANGER - enter password to permanently delete key:<enter password>
Key deleted forever (uh oh!)
```

#### Import

`hbtccli keys import Alice --file <private key file path>`

Save the above private key exported through `export' as Alice.pri:
```bash
hbtccli keys import alice ./alice.pri 
Enter passphrase to decrypt your key:<enter password>
```
## version
Show version info

### Example

#### Success response

## help
Show help information

### Example

```bash
hbtccli help
```

#### Success response

```bash
Command line interface for interacting with hbtc chain

Usage:
  hbtccli [command]

Available Commands:
  status      Query remote node for status
  config      Create or query an application CLI configuration file
  query       Querying subcommands
  tx          Transactions subcommands

  rest-server Start LCD (light-client daemon), a local REST server

  keys        Add or view local private keys

  version     Print the app version
  help        Help about any command

Flags:
      --chain-id string   Chain ID of tendermint node
  -e, --encoding string   Binary encoding (hex|b64|btc) (default "hex")
  -h, --help              help for hbtccli
      --home string       directory for config and data (default "/Users/rogan/.hbtcli")
  -o, --output string     Output format (text|json) (default "text")
      --trace             print out full stack trace on errors

Use "hbtccli [command] --help" for more information about a command.
```