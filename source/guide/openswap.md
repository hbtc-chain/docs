
## 代币兑换

openswap 是 hbtc-chain 上的一个自动做市商交易平台，用户可以创建任意的交易对，为交易对注入流动性并获得交易手续费的分成。openswap 基于 x * y = k 的恒定乘积公式来实现原子兑换，并支持限价挂单。

### 添加流动性

```bash
hbtccli tx mapping add-liquidity [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| token-a | string | 第一个币种 |
| token-b | string | 第二个币种 |
| token-a-amt | int | 第一个币种的数量，以最小精度为单位 |
| token-b-amt | int | 第二个币种的数量，以最小精度为单位 |

#### 示例：为 hbc-usdt 交易对添加流动性

```bash
hbtccli tx openswap add-liquidity --token-a hbc --token-b usdt --token-a-amt 1000000000000000000 --token-b-amt 4000000 --home node/hbtccli --from alice
```

### 移除流动性

```bash
hbtccli tx openswap remove-liquidity [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| token-a | string | 第一个币种 |
| token-b | string | 第二个币种 |
| liquidity | int | 移除的流动性数量 |


#### 示例：为 hbc-usdt 交易对移除流动性

```bash
hbtccli tx openswap remove-liquidity --token-a hbc --token-b usdt --liquidity 30000 --home node/hbtccli --from alice
```

### 快速兑换

快速兑换分为输入固定和输出固定两种交易模式。输入固定表示用户希望以固定数量的 a 币种兑换 b 币种，兑换到的 b 的数量不确定，但是可以指定最小得到的 b 数量；输出固定表示用户希望兑换固定数量的 b 币种，花费的 a 的数量不确定，但是可以指定最大花费的 a 数量。

#### 输入固定

```bash
hbtccli tx openswap exact-in [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| amt-in | in | 花费的币的数量，以最小精度为单位  |
| min-amt-out | int | 最少得到的币的数量，以最小精度为单位  |
| path | string | 兑换路径，如 "hbc,usdt,hdt" 表示先由 hbc 兑换成 usdt，再由usdt兑换成 hdt|
| receiver | string | 兑换币的收款地址 |
| referer | string | 邀请人的地址 |


#### 示例：由固定数量的 usdt 兑换 hbc

```bash
hbtccli tx openswap exact-in --amt-in 1000000 --min-amt-out 1000 --path usdt,hbc --home node/hbtccli --from alice
```

#### 输出固定

```bash
hbtccli tx openswap exact-out [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| max-amt-in | in | 最多花费的币的数量，以最小精度为单位  |
| amt-out | int | 得到的币的数量，以最小精度为单位  |
| path | string | 兑换路径，如 "hbc,usdt,hdt" 表示先由 hbc 兑换成 usdt，再由usdt兑换成 hdt|
| receiver | string | 兑换币的收款地址 |
| referer | string | 邀请人的地址 |


#### 示例：由 usdt 兑换固定数量的 hbc

```bash
hbtccli tx openswap exact-out --max-amt-in 1000000 --amt-out 1000 --path usdt,hbc --home node/hbtccli --from alice
```

### 限价单兑换

限价单兑换可以指定兑换的价格，如果当前不能成交，订单会处于委托状态，等价格满足条件时，再自动成交。

```bash
hbtccli tx openswap limit [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| amt-in | string | 花费的币的数量，以最小精度为单位 |
| price | string | 价格 |
| base-symbol | string | 基础币种 |
| quote-symbol | string | 竞价币种 |
| side | int | 下单方向，0-买入，1-卖出 |
| receiver | string | 兑换币的收款地址 |
| referer | string | 邀请人的地址 |

注明：base-symbol 和 quote-symbol 由一个交易对的两个币种的字母序节点，字母序小的即为 base-symbol。如 hbc-usdt 交易对，base-symbol 为 hbc，quote-symbol 为 usdt；hbc-btc 交易对，base-symbol 为 btc，quote-symbol 为 hbc。


#### 示例：发送 hbc 的买入限价单

```bash
hbtccli tx openswap limit --base-symbol hbc --quote-symbol usdt --amt-in 1000000000000000000 --price 10 --side 1 --home node/hbtccli --from alice
```

### 取消限价单
取消限价单命令可以批量取消处于未成交状态的订单。

```bash
hbtccli tx openswap cancel [order-ids]
```

#### 示例：取消两个订单

```bash
hbtccli tx openswap cancel-swap 99466110-708d-47b4-8276-390bf115d675,27eca534-7cd8-4c78-abec-823ffff78afb--home node/hbtccli --from alice
```

### 查询交易对

```bash
hbtccli query openswap pair [tokenA] [tokenB]
```
#### 示例：查询 hbc-usdt 交易对

```bash
hbtccli query openswap pair hbc usdt
```

成功后返回

```json
{
  "token_a": "hbc",
  "token_b": "usdt",
  "token_a_amount": "25013",
  "token_b_amount": "28132",
  "total_liquidity": "24772"
}
```

### 查询流动性

```bash
hbtccli query openswap liquidity [addr]
```
#### 示例：查询某地址提供的流动性

```bash
hbtccli query openswap liquidity HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt
```

成功后返回

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

### 查询订单

```bash
hbtccli query openswap order [orderID]
```
#### 示例：查询订单

```bash
hbtccli query openswap order 852ae30c-37dc-4ffb-8d1f-2567613e0121
```

成功后返回

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


### 查询订单簿

```bash
hbtccli query openswap orderbook [pair]
```
#### 示例：查询 hbc-usdt 交易对的订单簿

```bash
hbtccli query openswap orderbook hbc-usdt
```

成功后返回

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

### 查询当前委托

```bash
hbtccli query openswap pending-orders [pair] [addr]
```
#### 示例：查询某地址在 hbc-usdt 交易对的未成交订单

```bash
hbtccli query openswap pending-orders dot-hbc HBCZbyUiDY8YYDmy3HJ9eA65FFjRDdvDkMzt
```

成功后返回

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








