
## Token conversion

openswap is an automatic market making platfrom on hbtc-chain, on which users can create any trading pairs, provide liquidity and obtain transaction commission.  openswap realizes the atom convertion by the constant equation x * y = k,, limit orders are also supported.

### Provide liquidity

```bash
hbtccli tx mapping add-liquidity [flags]
```
#### Description of parameters

| Name        | Type   | Description                                 |
| ----------- | ------ | ------------------------------------------- |
| token-a     | string | Token a                                     |
| token-b     | string | Token b                                     |
| token-a-amt | int    | The amount of Token a, in mimimum precision |
| token-b-amt | int    | The amount of Token b, in mimimum precision |

#### Example：provide liquidity for hbc-usdt pair

```bash
hbtccli tx openswap add-liquidity --token-a hbc --token-b usdt --token-a-amt 1000000000000000000 --token-b-amt 4000000 --home node/hbtccli --from alice
```

### Remove liquidity

```bash
hbtccli tx openswap remove-liquidity [flags]
```
#### Description of parameters

| Name      | Type   | Description                         |
| --------- | ------ | ----------------------------------- |
| token-a   | string | Token a                             |
| token-b   | string | Token b                             |
| liquidity | int    | The  liquidity amount to be removed |


#### 


#### Example: remove liquidity of  hbc-usdt trading pair

```bash
hbtccli tx openswap remove-liquidity --token-a hbc --token-b usdt --liquidity 30000 --home node/hbtccli --from alice
```

### Quick conversion

There are two modes for quick conversion which are conversion with fixed source tokens and conversion with fixed target tokens. For conversion with fixed source tokens, user wish to convert fixed amount of token a  to token b, with no fixed amount of token bm while mininum of token b can be specified; for conversion with fixed target tokens,  user wish to convert to a fixed amount of token b, with uncertain amount of token a, while maximum amount of token a can be specified.

#### Conversion with fixed source tokens

```bash
hbtccli tx openswap exact-in [flags]
```
#### Description of parameters

| Name        | Type   | Description                                                  |
| ----------- | ------ | ------------------------------------------------------------ |
| amt-in      | in     | The amount of token for conversion, in minimum precision     |
| min-amt-out | int    | The amount of token can be converted to,in minimum precision |
| path        | string | Conversion path, for example  "hbc,usdt,hdt" means convert  hbc to usdt, and then convert usdt to hdt |
| receiver    | string | Receiver address for converted token                         |
| referer     | string | Address of referrer                                          |


#### Example: convert a fixed amount of usdt to  hbc

```bash
hbtccli tx openswap exact-in --amt-in 1000000 --min-amt-out 1000 --path usdt,hbc --home node/hbtccli --from alice
```

#### Conversion with fixed target tokens

```bash
hbtccli tx openswap exact-out [flags]
```
#### Description of parameters

| Name       | Type   | Description                                                  |
| ---------- | ------ | ------------------------------------------------------------ |
| max-amt-in | in     | Maximum amount of tokens for conversion, in minimum precision |
| amt-out    | int    | The amount of token can be converted to,in minimum precision |
| path       | string | Conversion path, for example, "hbc,usdt,hdt" means convert  hbc to usdt, and then convert usdt to hdt |
| receiver   | string | Receiver address for converted token                         |
| referer    | string | Address of referrer                                          |


#### Example：Convert usdt into a fixed amount of hbc

```bash
hbtccli tx openswap exact-out --max-amt-in 1000000 --amt-out 1000 --path usdt,hbc --home node/hbtccli --from alice
```

### Limit price conversion

Conversion price can be specified for limit price conversion. The order will be on pending if can not be filled immediately , and may be filled automatically later with the limited price. 

```bash
hbtccli tx openswap limit [flags]
```
#### Description of parameters

| Name         | Type   | Description                                                |
| ------------ | ------ | ---------------------------------------------------------- |
| amt-in       | string | Amount of tokens used for conversion, in minimum precision |
| price        | string | 价格                                                       |
| base-symbol  | string | base symbol                                                |
| quote-symbol | string | quota symbol                                               |
| side         | int    | Direction 0-buy，1-sell                                    |
| receiver     | string | Receiver address for converted token                       |
| referer      | string | Address of referrer                                        |



Note：base-symbol and quote-symbol are two token symbols of a trading pair，the one in fromt in alphabetical order is base-symbol, take hbc-usdt trading pair as an example，base-symbol is hbc，while quote-symbol is usdt；for hbc-btc trading pair，base-symbol is  btc，quote-symbol is hbc.


#### Example：send a limit-buy hbc order 

```bash
hbtccli tx openswap limit --base-symbol hbc --quote-symbol usdt --amt-in 1000000000000000000 --price 10 --side 1 --home node/hbtccli --from alice
```

### Cancel limit order

Unfilled orders can be cancelled in batch by following cancel limit order.

```bash
hbtccli tx openswap cancel [order-ids]
```

#### Example：cancel two orders 

```bash
hbtccli tx openswap cancel-swap 99466110-708d-47b4-8276-390bf115d675,27eca534-7cd8-4c78-abec-823ffff78afb--home node/hbtccli --from alice
```

### Query trading pairs

```bash
hbtccli query openswap pair [tokenA] [tokenB]
```
#### Example：query hbc-usdt trading pair

```bash
hbtccli query openswap pair hbc usdt
```

Successful return

```json
{
  "token_a": "hbc",
  "token_b": "usdt",
  "token_a_amount": "25013",
  "token_b_amount": "28132",
  "total_liquidity": "24772"
}
```

### Query liquidity

```bash
hbtccli query openswap liquidity [addr]
```
#### Example：query liquidity provided by certain address

```bash
hbtccli query openswap liquidity HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt
```

Successful return

```json
[
  {
    "trading_pair": {
      "token_a": "hbc",
      "token_b": "usdt",
      "token_a_amount": "25013",
      "token_b_amount": "28132",
      "total_liquidity": "24772"
    },
    "liquidity": "23772",
    "liquidity_share": "0.959631842402712740"
  },
  {
    "trading_pair": {
      "token_a": "hbc",
      "token_b": "btc",
      "token_a_amount": "3000000",
      "token_b_amount": "100000",
      "total_liquidity": "547722"
    },
    "liquidity": "546722",
    "liquidity_share": "0.998174256283297001"
  }
]
```

### Query order

```bash
hbtccli query openswap order [orderID]
```
#### Example：Query order

```bash
hbtccli query openswap order 852ae30c-37dc-4ffb-8d1f-2567613e0121
```

Successful return

```json
{
  "order_id": "852ae30c-37dc-4ffb-8d1f-2567613e0121",
  "from": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
  "referer": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
  "receiver": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
  "created_time": "1599740920",
  "expired_time": "-1",
  "finished_time": "0",
  "status": 1,
  "side": 0,
  "base_symbol": "hbc",
  "quote_symbol": "usdt",
  "price": "1.000000000000000000",
  "amount_int": "340000",
  "locked_fund": "16181",
  "remain_quantity": "16181"
}
```


### Query orderbook

```bash
hbtccli query openswap orderbook [pair]
```
#### Example：query order book of hbc-usdt trading pair 

```bash
hbtccli query openswap orderbook hbc-usdt
```

Successful return

```json
{
  "sell": [
    {
      "order_id": "f0203898-dcdf-41dc-84c0-3d6d2479ea01",
      "from": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "referer": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "receiver": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "created_time": "1599740816",
      "expired_time": "-1",
      "finished_time": "0",
      "status": 0,
      "side": 1,
      "base_symbol": "dot",
      "quote_symbol": "hbc",
      "price": "2.400000000000000000",
      "amount_int": "340000",
      "locked_fund": "340000"
    }
  ],
  "buy": [
    {
      "order_id": "852ae30c-37dc-4ffb-8d1f-2567613e0121",
      "from": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "referer": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "receiver": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
      "created_time": "1599740920",
      "expired_time": "-1",
      "finished_time": "0",
      "status": 1,
      "side": 0,
      "base_symbol": "dot",
      "quote_symbol": "hbc",
      "price": "1.000000000000000000",
      "amount_int": "340000",
      "locked_fund": "16181"
    }
]
}
```

### Query current pending orders

```bash
hbtccli query openswap pending-orders [pair] [addr]
```
#### Example：query pending orders under  hbc-usdt trading pair of a certain address

```bash
hbtccli query openswap pending-orders dot-hbc HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt
```

Successful return

```json
[
  {
    "order_id": "852ae30c-37dc-4ffb-8d1f-2567613e0121",
    "from": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
    "referer": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
    "receiver": "HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt",
    "created_time": "1599740920",
    "expired_time": "-1",
    "finished_time": "0",
    "status": 1,
    "side": 0,
    "base_symbol": "dot",
    "quote_symbol": "hbc",
    "price": "1.000000000000000000",
    "amount_int": "340000",
    "locked_fund": "16181",
    "remain_quantity": "16181"
  }
]
```








