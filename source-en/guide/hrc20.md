
## Toke issue
Users can issue tokens on the HBTC chain through the token issue feature, with the corresponding user being required to pay a certain amount gas fee (default is 1hbc). After issuance, all tokens will be transferred to a designated beneficiary address. The newly issued tokens can be traded on the HBTC chain.

```bash
hbtccli tx hrc20 new-token [to][symbol][decimals][totalSupply] [flags]
```
### Description of parameters

| Name        | Type   | Description                                                  |
| ----------- | ------ | ------------------------------------------------------------ |
| to          | string | Owner of the asset                                           |
| symbol      | string | The name of the newly issued token must not conflict with the name of the existing token and reserved token in the token module |
| decimals    | int    | Precision, minimum precision must not exceed 18 bits         |
| totalSupply | int    | Total circulation, in minimum precision                      |

### 

### 1.Issue an HRC20 token called mytoken
```bash
hbtccli tx hrc20 new-token $(hbtccli keys show -a alice) mytoken 18 10000000000000000000000000000 --from alice
```
Successful response
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

### 2.Query token information in the token module

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
  "withdrawal_fee": "0",
  "max_op_cu_number": "0",
  "sys_transfer_amount": "0",
  "op_cu_sys_transfer_amount": "0",
  "gas_limit": "0",
  "gas_price": "0"
}
```

### 3. Query the total amount of the token in the SUPPLY module

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
### 4. Query the token recipient's balance

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
### 5.  Transfer to other users

`hbtccli tx transfer send alice $(hbtccli keys show -a tom) 12345678mytoken`

Successful response
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
### 6. Query the recipient's balance

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

### 7. Query the sender's account balance

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