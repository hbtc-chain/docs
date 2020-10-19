
## 代币发行

hbtcchain 上支持两种类型的代币：hrc20 代币和跨链代币，代币的 symbol 需全局唯一。  
hrc20 代币仅可在 hbtcchain 链上流通，任何人都可以创建 hrc20 代币；跨链代币可以将其他链上的资产映射到 hbtcchain 上，支持充值提现等跨链操作，跨链代币需要通过提案创建。

### hrc20 代币发行
hrc20 代币是 hbtcchain 上的原生代币，用户可以通过 hrc20 模块的发行代币功能在hbtc链上发行代币，相应的用户需要缴纳一定的费用(1个hbc)。
发行之后，所有的代币将会转到指定的接收地址。新发行的代币可以在hbtc chain上交易。

```bash
hbtccli tx hrc20 new-token [to][symbol][decimals][totalSupply] [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| to | string | 资产的所有者 |
| symbol | string | 新发币种的名称，不能与token模块中已有币种名称和预留币种名称冲突 |
| decimals | int | 精度，最小精度不能超过18位 |
| totalSupply | int | 总发行量，以最小精度为单位 |

#### 发行一个名为mytoken的hrc20代币
```bash
hbtccli tx hrc20 new-token $(hbtccli keys show -a alice) mytoken 18 10000000000000000000000000000 --from alice
```
成功返回

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

### 跨链代币发行
跨链代币需要通过提案创建，提案投票通过之后，用户即可通过跨链充值操作将其他链的代币映射成 hbtcchain 上创建的跨链代币，也可以通过跨链提现操作将跨链代币映射回对应链上。

#### 发行跨链代币 hdai
```bash
hbtccli tx gov submit-proposal add-token proposal.json --from alice
```
proposal.json 的文件内容为：

```json
{
  "title": "add token",
  "description": "add a new token hdai",
  "token_info":{
  	"symbol": "hdai",
  	"issuer": "0x6b175474e89094c44da98b954eedeac495271d0f",
  	"chain": "eth",
  	"type": "2",
  	"is_send_enabled": true,
  	"is_deposit_enabled": true,
  	"is_withdrawal_enabled": true,
  	"decimals": "18",
  	"total_supply": "1000000000000000000000000000",
  	"collect_threshold": "1000000000000000000",
  	"deposit_threshold": "1000000000000000000",
  	"open_fee": "28000000000000000000",
  	"sys_open_fee": "28000000000000000000",
  	"withdrawal_fee_rate": "2.0",
  	"max_op_cu_number": "10",
  	"systransfer_num": "5",
  	"op_cu_systransfer_num": "30",
  	"gas_limit": "80000",
  	"gas_price": "1000"
  }
  "deposit": [
    {
      "denom": "hbc",
      "amount": "10000"
    }
  ]
}
```

提案通过以后，用户即可将 erc20 代币 dai 映射成 hbtcchain 上的代币 hdai.

### 代币信息查询

#### 在token模块查询币种信息

`hbtccli query token token mytoken` 

```json
{
  "symbol": "mytoken",
  "issuer": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
  "chain": "hbc",
  "type": "2",
  "is_send_enabled": true,
  "is_deposit_enabled": false,
  "is_withdrawal_enabled": false,
  "decimals": "18",
  "total_supply": "10000000000000000000000000000",
  "collect_threshold": "0",
  "deposit_threshold": "0",
  "open_fee": "0",
  "sys_open_fee": "0",
  "withdrawal_fee_rate": "0",
  "max_op_cu_number": "0",
  "sys_transfer_amount": "0",
  "op_cu_sys_transfer_amount": "0",
  "gas_limit": "0",
  "gas_price": "0"
}
```

#### 在supply模块查询该币种的总量

`hbtccli query supply total`

```json
[
  {
    "denom": "hbc",
    "amount": "3010000000305066164727355691583"
  },
  {
    "denom": "mytoken",
    "amount": "10000000000000000000000000000"
  }
]
```
#### 查询接收CU余额

`hbtccli query cu cuinfo $(hbtccli keys show -a alice)`

```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "cu_type": "1",
    "address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "public_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "A6yKYe1iQiKjjI3yjsF83YeT5p+6ksdqyDXB6rDNL7u9"
    },
    "sequence": "8",
    "coins": [
      {
        "denom": "hbc",
        "amount": "9919990000000000000000000000"
      },
      {
        "denom": "mytoken",
        "amount": "10000000000000000000000000000"
      }
    ],
    "coins_hold": [],
    "assets": null,
    "asset_coins": [],
    "asset_coins_hold": [],
    "cu_number": "0",
    "asset_pubkey": null,
    "gas_used": [],
    "gas_received": []
  }
}
```
#### 给其他用户转账

`hbtccli tx transfer send alice $(hbtccli keys show -a tom) 12345678mytoken`

发送成功后返回

```json
{
  "height": "0",
  "txhash": "6636F9B0A6A0FFC71B265641941396DA87C9D13B2E37F84CB3530266EAABEF1E",
  "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"send\"}]}]}]",
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
              "value": "send"
            }
          ]
        }
      ]
    }
  ]
}
```
#### 查询接收者的余额

`hbtccli query cu cuinfo $(hbtccli keys show -a tom)`

```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "cu_type": "1",
    "address": "HBCa7p52Zr1ZVj52Ldc5uFpEMDP6PhzbtxrN",
    "public_key": null,
    "sequence": "0",
    "coins": [
      {
        "denom": "hbc",
        "amount": "10000000000000000000000000000"
      },
      {
        "denom": "mytoken",
        "amount": "12345678"
      }
    ],
    "coins_hold": [],
    "assets": null,
    "asset_coins": [],
    "asset_coins_hold": [],
    "cu_number": "0",
    "asset_pubkey": null,
    "gas_used": [],
    "gas_received": []
  }
}
```

#### 查询发送者的账户余额

`hbtccli query cu cuinfo $(hbtccli keys show -a alice)`

```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "cu_type": "1",
    "address": "HBCgS6KSUhmudwbh88tRynzVu86fFghFA6Pg",
    "public_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "A6yKYe1iQiKjjI3yjsF83YeT5p+6ksdqyDXB6rDNL7u9"
    },
    "sequence": "3",
    "coins": [
      {
        "denom": "hbc",
        "amount": "9949990000000000000000000000"
      },
      {
        "denom": "mytoken",
        "amount": "9999999999999999999987654322"
      }
    ],
    "coins_hold": [],
    "assets": null,
    "asset_coins": [],
    "asset_coins_hold": [],
    "cu_number": "0",
    "asset_pubkey": null,
    "gas_used": [],
    "gas_received": []
  }
}
```