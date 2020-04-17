# 命令行参考

## status
查询链的状态

##### 示例
```bash
hbtccli  status
```
##### 成功返回
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
### 显示client 的配置

##### 示例
```bash
hbtccli config
```
##### 成功返回
```bash
chain-id = "hbtc-testnet"
indent = true
output = "json"
trust-node = true
```

### 配置client
将常用的配置信息存放在.hbtcli/config/config.toml中
```bash
hbtccli config <key> [value] [flags]
```

##### 示例
```bash
hbtccli config indent  false
hbtccli config chain-id  hbtc-testnet
hbtccli config output  text
hbtccli config trust-node  true
```

## query

### tendermint-validator-set

查询当前validators
```bash
hbtccli query tendermint-validator-set
```

#### 示例
```bash
hbtccli query tendermint-validator-set
```
#### 成功返回
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
查询指定高度的区块内容
#### 示例
```bash
hbtccli query  block 50
```
#### 成功返回
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
#### 示例
```

```

#### 成功返回
```

```

### tx

根据hash查找交易 

``` bash
hbtccli query tx [hash]
```


#### 示例
```bash
hbtccli query tx E81EC801B96C99E99BA2EAA73624AF5FAA7A0356894846BB11C70D57B62937AD --trust-node
```

#### 成功返回
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
#### 查询mint的参数
```bash
hbtccli query mint params
```
##### 示例 
```bash
hbtccli query mint params
```

##### 成功返回
```json
{
  "mint_denom": "hbc",
  "blocks_per_year": "10519200",
  "inflation": "0.030000000000000000",
  "initial_price": "0.100000000000000000",
  "current_price": "0.100000000000000000",
  "node_cost_per_month": "2600.000000000000000000"
}
```


### token
#### 查询所有支持币种名称
```bash
hbtccli query token symbols
```

##### 示例
```bash
hbtccli query token symbols
```
##### 成功返回

```json
[
  "btc",
  "eth",
  "hbc",
  "tusdt"
]
```
#### 查询所有支持币种信息
```bash
hbtccli query token tokens
```

##### 示例
```bash
hbtccli query token tokens
```
##### 成功返回

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

#### 查询某一个币种信息
```bash
hbtccli query token token [symbol] 
```

##### 示例
```bash
hbtccli query token token tusdt 
```
##### 成功返回

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

#### 查询某一个币种的精度信息
```bash
hbtccli query token decimal [symbol] 
```

##### 示例
```bash
hbtccli query token decimal tusdt 
```
##### 成功返回

```json
{
  "decimals": "6"
}                                                    
```


#### 查询模块的参数
```bash
hbtccli query token params 
```

##### 示例
```bash
hbtccli query token params
```
##### 成功返回

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
有些发送到链上的交易会产生order，比如keygen(创建资产地址)、deposit（充币）,withdrawal(提币)等交易。可以根据交易返回的orderid，查询order详情。
```bash
hbtccli query order order 3b16978a-a435-4b64-acc3-7e15b571319b 
```
##### 成功返回
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

#### 查询token发行数量
```bash
hbtccli query supply total
```

##### 示例
```bash
hbtccli query supply total
```

##### 成功返回
```json
[
  {
    "denom": "hbc",
    "amount": "3010000000060289755874971480550"
  }
]
```


### gov 
#### 查询gov模块所有参数
```bash
hbtccli query gov params
```
##### 示例
```bash
hbtccli query gov params
```
##### 成功返回
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


#### 查询gov模块的抵押，投票等参数
```bash
hbtccli query gov param [voting/tallying/deposit]
```

##### 示例
```bash
hbtccli  query gov param deposit
```
##### 成功返回
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

#### 查询一个提案
根据proposal id精确的查询某个提案的内容
```bash
hbtccli query gov proposal [proposal-id] [flags]
```
##### 参数说明

| 名称   | 类型   | 参数说明|
| ------ | ------ | ------ |
|proposal-id | string | proposal id|


##### 示例
```bash
hbtccli query gov proposal 1
```
##### 成功返回
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

#### 查询一类提案
```bash
hbtccli query gov proposals  [flags]
```
##### 常用查询选项

| 名称  | 类型 | 参数说明 |
| ------ | ------ | ------ |
| --depositor| string | 查询depositor抵押了资产的提案 |
| --voter | string | voter 投过票的提案|
| --status | string | 提案目前的状态|



##### 示例
```bash
hbtccli query gov proposals --depositor $(hbtccli keys show -a alice)
hbtccli query gov proposals --voter $(hbtccli keys show -a alice)
hbtccli query gov proposals --status (DepositPeriod|VotingPeriod|Passed|Rejected)
```

#### 查询某voter对某提案的抵押信息
```bash
hbtccli query gov deposit [proposal-id] [depositor-addr] [flags]
```

##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| proposal-id | string | proposal id |
| depositor-addr | string | depositor地址|

##### 示例
```bash
hbtccli query gov deposit 1 $(hbtccli keys show -a alice)
```

##### 成功返回
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

#### 查询某提案的全部抵押信息
```bash
hbtccli query gov deposits [proposal-id][flags] 
```

##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| proposal-id | string | proposal id |


##### 示例
```bash
hbtccli query gov deposits 1 
```

##### 成功返回
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


#### 查询某voter对某提案的投票信息
```bash
hbtccli query gov vote [proposal-id] [voter-addr] [flags]
```
##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| proposal-id | string | proposal id |
| depositor-addr | string | depositor地址 |

##### 示例
```bash
hbtccli query gov vote 1 $(hbtccli keys show -a alice)
```
##### 成功返回
```json
{
  "proposal_id": "1",
  "voter": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "option": "Yes"
}
```

#### 查询某提案的全部投票信息
```bash
hbtccli query gov votes [proposal-id] [flags]
```
##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| proposal-id | string | proposal id |




##### 示例
```bash
hbtccli query gov votes 1 
```
##### 成功返回
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



#### 查询某提案的发起者
```bash
hbtccli query gov proposer [proposal-id] [flags] 
```

##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ | 
| proposal-id | string | proposal id |



##### 示例
```bash
hbtccli query gov proposer 1
```

##### 成功返回
```json
{
  "proposal_id": "1",
  "proposer": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg"
}
```


#### 查询某提案投票结果
```bash
hbtccli query gov tally [proposal-id] [flags] 
```

##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ | 
| proposal-id | string | proposal id |

##### 示例
```bash
hbtccli query gov tally 1
```

##### 成功返回
```json
{
  "yes": "0",
  "abstain": "0",
  "no": "0",
  "no_with_veto": "0"
}
```

### staking 

#### 查询staking模块的参数
```bash
hbtccli query staking params
```

##### 示例
```bash
hbtccli query staking params
```

##### 成功返回
```json
{
  "unbonding_time": "1814400000000000",
  "max_validators": 100,
  "max_entries": 7,
  "bond_denom": "hbc",
  "MinSelfDelegation": "5000000000000000000000000"
}
```

#### 查询所有的validators
```bash
hbtccli query staking validators
```
##### 示例
```bash
hbtccli query staking validators
```
##### 成功返回
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


#### 查询某一个validator
```bash
hbtccli query staking validator [validator-addr] [flags]
```

##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli query staking validator hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### 成功返回
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

#### 查询某delegtor给某validator的抵押
```bash
hbtccli query staking delegation [delegator-addr] [validator-addr] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| delegator-addr | string | 以HBC开头的delegator地址 |
| validator-addr | string | 以hbcvaloper开头的validator地址 |


##### 示例
```bash
hbtccli query staking delegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### 成功返回
```json
{
  "delegator_address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "validator_address": "hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun",
  "shares": "120000000000000000000.000000000000000000",
  "balance": "120000000000000000000"
}
```

#### 查询某delegtor所有的抵押
```bash
hbtccli query staking delegations [delegator-addr] [flags]
```

##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| delegator-addr | string | 以HBC开头的delegator地址 |



##### 示例
```bash
hbtccli query staking delegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```

##### 成功返回
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

#### 查询某delegtor给某validator的正在解冻的抵押
```bash
hbtccli query staking unbonding-delegation [delegator-addr] [validator-addr] [flags]
```

##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| delegator-addr | string | 以HBC开头的delegator地址 |
| validator-addr | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli query staking unbonding-delegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### 成功返回
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


#### 查询某delegtor所有的正在解冻的抵押
```bash
hbtccli query staking unbonding-delegations [delegator-addr] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| delegator-addr | string | 以BHC开头的delegator地址 |



##### 示例
```bash
hbtccli query staking unbonding-delegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```
##### 成功返回
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

#### 查询某delegtor redeleagte的抵押
```bash
hbtccli query staking redelegation [delegator-addr] [src-validator-addr] [dst-validator-addr] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| delegator-addr | string | 以HBC开头的delegator地址 |
| src-validator-add | string | 以hbcvaloper开头的源validator地址 |
| dst-validator-addr | string | 以hbcvaloper开头的目的validator地址 |

##### 示例
```bash
query staking redelegation HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z
```

##### 成功返回
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

#### 查询某delegtor所有redelegate抵押
```bash
hbtccli query staking redelegations 
```

##### 示例
```bash
hbtccli query staking redelegations HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg
```

##### 成功返回
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

#### 查询validator收到的所有抵押
```bash
  hbtccli query staking delegations-to [validator-addr] [flags]
```

##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |


##### 示例
```bash
 hbtccli query staking delegations-to hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### 成功返回
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

#### 查询所有从某validator redelegate给其他validator 的抵押
```bash
hbtccli query staking redelegations-from [validator-addr] [flags]
```
##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli query staking redelegations-from hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### 成功返回
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


#### 查询validator正在解冻的抵押
```bash
hbtccli query staking unbonding-delegations-from [validator-addr] [flags]
```
##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli query staking unbonding-delegations-from hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```

##### 成功返回
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


#### 查询staking pool中的金额
```bash
$hbtccli query staking pool
```
##### 示例
```bash
$hbtccli query staking pool
```

##### 成功返回
```json
{
  "not_bonded_tokens": "30000000000000000000",
  "bonded_tokens": "400000170000000000000000000"
}
```


### distribution 

#### 查询distribution的参数
```bash
hbtccli query distribution params
```
##### 示例
```bash
hbtccli query distribution params
```
##### 成功返回
```json
{
  "community_tax": "0.020000000000000000",
  "base_proposer_reward": "0.010000000000000000",
  "bonus_proposer_reward": "0.040000000000000000",
  "withdraw_addr_enabled": true
}
```

#### 查询validator-outstanding-rewards
```bash
hbtccli query distribution validator-outstanding-rewards [validator] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| validator | string | 以hbcvaloper开头的validator地址 |



##### 示例
```bash
hbtccli query distribution validator-outstanding-rewards hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### 成功返回
```json
[
  {
    "denom": "hbc",
    "amount": "2660287954396406984212.455000000000000000"
  }
]
```

#### 查询validator的commisssion
```bash
 hbtccli query distribution commission [validator] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| validator | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli query distribution commission hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### 成功返回
```json
null
```
注：因为目前几个validator 的commission都设置为0

#### 查询validator的slashes
```bash
hbtccli query distribution slashes [validator] [start-height] [end-height] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| validator | string | hbcvaloper开头的validator地址 |
| start-height | string | start hegiht |
| end-height | string | end hegiht |

##### 示例
```bash
hbtccli query distribution slashes hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun 0 100
```

##### 成功返回
```json
null
```


#### 查询validator的rewards
```bash
hbtccli query distribution rewards [delegator-addr] [<validator-addr>] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| delegator-addr | string | 以HBC开头的delegator地址 |
| validator-addr | string | 以hbcvaloper开头的validator地址,可选 |


##### 示例
```bash
hbtccli query distribution rewards HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun
```
##### 成功返回
```json
[
  {
    "denom": "hbc",
    "amount": "962401463225280.000000000000000000"
  }
]
```

#### 查询community-pool
```bash
hbtccli query distribution community-pool
```
##### 示例
```bash
hbtccli query distribution community-pool
```
##### 成功返回
```json
[
  {
    "denom": "hbc",
    "amount": "219939930488250056843.400000000000000000"
  }
]
```


### slashing 

#### 查询slashing的参数
```bash
hbtccli query slashing params
```
##### 示例
```bash
hbtccli query slashing params
```
##### 成功返回
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

#### 查询一个validator 的签名信息

```bash
hbtccli query slashing signing-info [validator-conspub] [flags]
```

##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| validator-conspub | string | 以hbcvalconspub开头的validator 公钥 |

##### 示例

```bash
hbtccli query slashing signing-info hbcvalconspub1zcjduepq69plcv4nzg27qashf328q0p6uc8cdpl4u3fz5sd2ugz34nk0u4ws2zrp0f
```
##### 成功返回

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
#### 查询hrc20模块参数
```bash
hbtccli query hrc20 params
```
##### 示例
```bash
hbtccli query hrc20 params
```
##### 成功返回
```json
{
  "issue_token_fee": "10000000000000000000000"
}
```

### cu
#### 查询某个cu的信息
```bash
hbtccli query cu cuinfo [cu_addr][flags] 
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| cu-addr | string | 以HBC开头的托管托单元地址 |

##### 示例
```bash
hbtccli query cu cuinfo $(hbtccli keys show -a alice)
```
##### 成功返回
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

#### 查询某个cu 某个币种的数量
```bash
hbtccli query cu cucoin [cu_addr][symbol] 
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| cu-addr | string | 以HBC开头的托管托单元地址 |
| symbol | string | 币种名称 |

##### 示例
```bash
hbtccli query cu cucoin $(hbtccli keys show -a alice) eth
```
##### 成功返回
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

#### 查询某个币种的opcu信息
```bash
hbtccli query cu op [symbol] 
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| symbol | string | 币种名称 |

##### 示例
```bash
hbtccli query cu eth
```
##### 成功返回
```

```

### mapping

用于查询资产映射模块的信息

#### 查询单个资产映射合约
```bash
hbtccli query mapping info [issue-symbol]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| issue-symbol | string | 被查询的资产映射合约的发行token symbol |

##### 返回值说明

| 名称 | 类型 | 返回值说明 |
| ------ | ------ | ------ |
| issue_symbol | string | 资产映射合约的发行token symbol |
| target_symbol | string | 资产映射合约的映射目标token symbol |
| total_supply | string | 发行token总量，于映射目标token发行量一致 |
| issue_pool | string | 发行池里剩余token总量，total_supply - issue-pool为发行出去的token总量 |
| enabled | bool | 是否允许发行和兑换 |

##### 示例
```bash
hbtccli query mapping info cbtc
```
##### 成功返回
```json
{
  "issue_symbol": "cbtc",
  "target_symbol": "btc",
  "total_supply": "2100000000000000",
  "issue_pool": "2099999999876644",
  "enabled":true
}
```

#### 查询所有资产映射合约
```bash
hbtccli query mapping list
```

##### 返回值说明

返回所有资产映射合约的信息，以数组方式，每个项内容参考上一节

##### 示例
```bash
hbtccli query mapping list
```
##### 成功返回
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
#### 创建运营托管单元（OPCU）
```bash
hbtccli tx keygen newopcu [from_key_or_address] [symbol] [Op_CU_address]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| from_key_or_address | string | newopcu交易发起者地址 |
| symbol | string | 币种 |
| to | string | OPCU地址 |

##### 示例
创建一个eth运营托管单元，地址为HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo, 该地址必须是未被使用的地址
```bash
hbtccli tx keygen newopcu HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg eth HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc --home ../testnetdocker/node0/hbtccli
```
##### 成功返回
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
Password to sign with 'node0':<输入密码>
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

#### 为托管单元（CU）生成币种地址
```
keygen [from_key_or_address] [symbol] [to]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| from_key_or_address | string | keygen交易发起者地址 |
| symbol | string | 币种 |
| to | string | 创建币种地址的所有者 |

##### 示例
为HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo 生成eth地址 
```bash
hbtccli tx keygen keygen HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg eth HBCPoshPen4yTWCwCvCVuwbfSmrb3EzNbXTo --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc --home ../testnetdocker/node0/hbtccli
```
##### 成功返回
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
Password to sign with 'node0':<输入密码>
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
#### 发起文本提案
```bash
hbtccli tx gov submit-proposal --title="Test Proposal Title" --description="Test Proposal Contents" --type="Text" --deposit="10hbc" --from mykey --gas-prices 1000000000000.0hbc
```
或者
```bash
hbtccli tx gov submit-proposal --proposal="path/to/proposal.json" --from mykey --gas-prices 1000000000000.0hbc
```

##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| title | string | 提案的标题 |
| description | string | 提案的内容 |
| type | string | 发起提案的类型（这里指定为Text |
| from | string | 提案发起者 |

##### 示例
```bash
hbtccli tx gov submit-proposal --title="Test Proposal Title" --description="Test Proposal Contents" --type="Text" --deposit="100000000000000000000000hbc" --from alice --gas-prices 1000000000000.0hbc
```

##### 成功返回
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

#### 发起修改参数提案
```bash
tx gov submit-proposal param-change <path/to/proposal.json> --from=<key_or_address>
```

##### 示例
```bash
hbtccli tx gov submit-proposal param-change staking_params_change.json --from alice
```
##### 成功返回
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


#### 发起community-pool-spend提案
```bash
tx gov submit-proposal community-pool-spend <path/to/proposal.json> --from=<key_or_address>
```

##### 示例
```bash
hbtccli tx gov submit-proposal community-pool-spend community_pool_spend.json --from alice
```
##### 成功返回
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



#### 发起投票上币提案
```bash
tx gov submit-proposal add-token <path/to/proposal.json> --from=<key_or_address>
```

##### 示例
```bash
hbtccli tx gov submit-proposal add-token add_token_proposal.json --from alice
```
##### 成功返回
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

#### 发起修改币种参数提案
```bash
tx gov submit-proposal token-params-change <path/to/proposal.json> --from=<key_or_address>
```

##### 示例
```bash
hbtccli tx gov submit-proposal token-params-change token_params_change_proposal.json --from alice
```
##### 成功返回
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

#### 发起投票下币提案
```bash
tx gov submit-proposal disable-token <path/to/proposal.json> --from=<key_or_address>
```

##### 示例
```bash
hbtccli tx gov submit-proposal disable-token disable_token_proposal.json --from alice
```
##### 成功返回
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


#### 为某个提案抵押资金
```bash
hbtccli tx gov deposit [proposal-id] [amount]
```

##### 参数说明

| 名称 | 类型 |参数说明 |
| ------ | ------ | ------ |
| proposal-id | string | proposal id |
| amount | string | 抵押的资金 |


##### 示例
```bash
hbtccli tx gov deposit 1 10000000000000000000000000hbc --gas-prices 1000000000000.0hbc --from alice
```
##### 成功返回
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

#### 为某个提案投票
```bash
hbtccli tx gov vote [proposal-id] [option] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| proposal-id | string | proposal id |
| options | string | 投票选项yes/no/abstain/nowithveto |



##### 示例
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

### staking
#### 将资产抵押给validator
 ```bash
 hbtccli tx staking delegate [validator-addr] [amount] [flags]
 ```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |
| amount | string | 币种以及金额 |

##### 示例

```bash
hbtccli tx staking delegate hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun  100000000000000000000hbc --from alice --gas-prices 1000000000000.0hbc
```
##### 成功返回
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

#### 将资产从一个validator 抵押给另外一个validator
 ```bash
hbtccli tx staking redelegate [src-validator-addr] [dst-validator-addr] [amount] [flag]
 ```
##### 参数说明


| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| src-validator-addr | string | 以hbcvaloper开头的源validator地址 |
| dst-validator-addr | string | 以hbcvaloper开头的目的validator地址 |
| amount | string | 币种以及金额 |


##### 示例

```bash
hbtccli tx staking redelegate hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun hbcvaloper136g7jus2k0x7xv7wfusf5npzl5c3uf2cgrwf7z 50000000000000000000hbc --from alice --gas-prices 1000000000000.0hbc
```
##### 成功返回
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


### distribution

#### 设置delegator rewards 的受益地址
```bash
 hbtccli tx distribution set-withdraw-addr [withdraw-addr] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| withdraw-addr | string | 以HBC开头受益托管单元地址 |

##### 示例
```bash
 hbtccli tx distribution set-withdraw-addr HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg --from mykey --gas-prices 1000000000000.0hbc

```

##### 成功返回
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

#### 从某个validator提取抵押收益
```bash
hbtccli tx distribution withdraw-rewards [validator-addr] [flags]
```

##### 参数说明

| 名称 | 类型 | 参数说明 |
| ------ | ------ | ------ |
| validator-addr | string | 以hbcvaloper开头的validator地址 |

##### 示例
```bash
hbtccli tx distribution withdraw-rewards hbcvaloper1mcfzdxltqmjfa8v5wrqrjjedqd8lu88f3hsmun --from alice --gas-prices 1000000000000.0hbc
```

##### 成功返回
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
#### 从所有validator提取抵押收益
```bash
hbtccli tx distribution withdraw-all-rewards [flags]
```

##### 示例
```bash
hbtccli tx distribution withdraw-all-rewards --from alice --gas-prices 1000000000000.0hbc
```
##### 成功返回
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
#### HBTC Chain系统内部转账 

```bash
hbtccli tx transfer send [from] [to][amount][flags] 
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| from | string | 资产的所有者 |
| to | string | 转入的托管单元地址 |
| amount | string | 币种以及金额，多个资产是以逗号分隔。例如100hbc，2btc |



##### 示例
```bash
hbtccli tx transfer send alice  HBCjN2VxLCBMbFKafhjVa8auudMpTpmDgeE8  1000000000000000hbc --chain-id hbtc-testnet  --gas-prices 1000000000000.0hbc
```

#### 成功返回
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


#### 将外链资产充值到HBTC Chain

```bash
hbtccli tx transfer deposit [from_key_or_address] [toCU_address] [to_address] [coin] [txhash] [index] [memo] [height] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| from_key_or_address | string | 充值的发起人，可以是toCU的所有者也可以是其他人 |
| to_cu | string | 被充值的托管单元地址 |
| to_address | string | 被充值的托管单元地址对应币种的外链(例如:btc eth)地址 |
| amount | string | 币种以及金额 |
| hash | string | 外链交易hash |
| index | string | 外链交易索引，对于utxo类型资产, index 等于Vout中的index值;对于账户类型资产，index = 0 |
| memo | string | 外链交易中附带的memo |
| height | string | 外链交易发生的区块高度 |




##### 示例
```bash
hbtccli tx transfer deposit alice $(hbtccli keys show -a bob) 0x6537f7fb0064aaa4b5b9f379d24133027155b727 10000000000000000eth 0x228409bb2999911b94f0513f101f3fcf212058b7af18c88c625b41ddf20a0c6b 0 memo 7505327 --chain-id hbtc-testnet --gas-prices 1000000000000.0hbc
```

##### 成功返回
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




#### 将资产提现到外链地址
```bash
hbtccli tx transfer withdrawal [from_key_or_address] [to_address] [amount] [gas] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| from_key_or_address | string | 充值的发起人，可以是toCU的所有者也可以是其他人 |
| to_address | string | 被充值的托管单元地址对应币种的外链(例如:btc eth)地址 |
| amount | string | 币种以及金额 |
| gas | string | 以外链币计价的手续费 |


##### 示例
```bash
hbtccli tx transfer withdrawal --chain-id hbtc-testnet alice  0xc96d141c9110a8E61eD62caaD8A7c858dB15B82c  1200000000000000eth  1000000000000000 --gas-prices 1000000000000.0hbc
```
##### 成功返回
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
#### 一键发币
在hbtc链上，用户缴纳了hrc20 参数中定义的发行费用(缺省为10000000000000000000000 * pow(10, -18)hbc)
```bash
hbtccli tx hrc20 new-token [to][symbol][decimals][totalSupply] [flags]
```
##### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| to | string | 资产的所有者 |
| symbol | string | 新发币种的名称，不能与token模块中已有币种名称和预留币种名称冲突 |
| decimals | int | 精度，最小精度不能超过18位 |
| totalSupply | int | 总发行量，以最小精度为单位 |

##### 示例
```bash
hbtccli tx hrc20 new-token $(hbtccli keys show -a alice) mytoken 18 10000000000000000000000000000 --from alice
```

##### 成功返回
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
#### 映射发行和兑换
通过一个资产映射合约，用户可以抵押映射发行或者兑换发行token和目标token。
```bash
hbtccli tx mapping swap [issue-symbol] [coins] [flags]
```
##### 参数说明

| 名称 | 类型 | 参数说明 | 
| ------ | ------ | ------ |
| issue-symbol | string | 资产映射合约的发行token |
| coins | string | 需要兑换的coins，只能有一个coin，必须是发行token或者目标token |

##### 示例
```bash
# 从cbtc映射合约里，抵押50btc，发行出50cbtc
hbtccli tx mapping swap --chain-id hbtc-testnet cbtc 50btc --from alice
# 从cbtc映射合约里，抵押50cbtc，兑换回50btc
hbtccli tx mapping swap --chain-id hbtc-testnet cbtc 50cbtc --from alice
```

##### 成功返回
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
从本地启动一个rest server
```bash
hbtccli rest-server [flags] 
```
| 名称 | 类型  | flag说明 | 
| ------ | ------ | ------ |
| laddr string | string | rest server监听地址，(default "tcp://localhost:1317") |
| max-open | uint | 最大连接数 |
| node | string | 链节点地址<host>:<port>，(default "tcp://localhost:26657") |
| trust-node | string | 信任连接的节点 |


### 示例
```bash
hbtccli rest-server --home node0/hbtccli --chain-id hbtc-testnet --node tcp://127.0.0.1:26657 --trust-node true 
```
### 正常返回
```
I[2020-03-14|09:18:04.726] Starting application REST service (chain-id: "hbtc-testnet")... module=rest-server
I[2020-03-14|09:18:04.727] Starting RPC HTTP server on 127.0.0.1:1317   module=rest-server
```

## keys

本地密钥库主要包含以下指令：
* `hbtccli keys add`     [新增密钥](#新增) (#列表)
* `hbtccli keys list`    [显示密钥列表](#列表)
* `hbtccli keys update`  [更新密钥保存密码](#更新)
* `hbtccli keys delete`  [从密钥库删除密钥](#删除)
* `hbtccli keys import`  [导入密钥](#导入)
* `hbtccli keys export`  [导出密钥](#导出)

> 密钥库为本地存储，默认存储位置为：$HOME/.hbtccli/keys/，删除存储文件会清空本地存储所有私钥。通过`keys`相关指令操作密钥不影响QOS网络中账户状态，请妥善保管账户私钥信息。

#### 新增

`hbtccli keys add <key_name>`

<key_name>可随意填写，仅作为本地密钥库密钥区分。

如下指令将生成一个名字为`Alice`的密钥到本地密钥库：
```bash
$ hbtccli keys add Alice
Enter a passphrase to encrypt your key to disk:<输入密码>
Repeat the passphrase:<重复上面输入的密码>
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
其中`HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg`为适用于QOS网络的账户地址，`hbcpub1addwnpepqwkg5c0dvfpz9guv3hegastumkre8e5lh2fvw6kgxhq74vxd97am6kmsnf0`为账户公钥信息，`rare nuclear foster thunder wonder core section file utility service quiz correct lion frost piano split aisle weather depth main trumpet lobster fire connect`为助记词，可用于账户私钥找回，请妥善保管助记词。

#### 列表

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

#### 更新

`hbtccli keys update <key_name>`

更新`Alice`存储密码：
```bash
$ hbtccli keys update Alice
Enter the current passphrase:<输入当前密码>
Enter the new passphrase:<输入新密码>
Repeat the new passphrase:<重复新密码>
Password successfully updated!
```

#### 导出

`hbtccli keys export <key_name>`

导出`Alice`密钥信息：
```bash
hbtccli keys export Alice
Enter passphrase to decrypt your key:<输入当前密码>
Enter passphrase to encrypt the exported key:<输入密码>
-----BEGIN TENDERMINT PRIVATE KEY-----
salt: A6528A0F9D47D2A8E949037D27A4BDD8
kdf: bcrypt

3DgFM6oCq7DWwxxjkzEvk3M53y3UnP5g3cAEFR7oYwvibG6+XBbdhncX1vKFeK/m
79ofswcWI/VRuzxg9s+NXwnRYUFU4tLYPYI58FA=
=JCP8
-----END TENDERMINT PRIVATE KEY-----
```

#### 删除

`hbtccli keys delete <key_name>`

删除`Alice`密钥信息：
```bash
$ hbtccli keys delete alice
DANGER - enter password to permanently delete key:<输入密码>
Key deleted forever (uh oh!)
```

#### 导入

`hbtccli keys import Alice --file <私钥文件路径>`

把上面通过`export`导出的私钥存为alice.pri文件：
```bash
hbtccli keys import alice ./alice.pri 
Enter passphrase to decrypt your key:<输入密码>
```
## version
显示version信息

##### 示例

##### 成功返回

## help
显示help信息

##### 示例
```bash
hbtccli help
```
##### 成功返回
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