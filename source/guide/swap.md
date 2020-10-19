## 跨链资产闪兑（跨链OTC）


前提：可以参照和HBTC链的交互方式，用户分别创建托管单元和充值了跨链资产，目前支持两种闪兑方式：
- 自由闪兑（用户可以按照指定的价格创建一个闪兑订单）
- 定向闪兑（用户可以创建一个指定成交方和指定数量的订单）

###  创建自由闪兑

用户创建一个自由闪兑订单（类otc），可以设定自己订单的总共可以兑换数量，目标兑换资产，以及可以兑换的数量限制以及订单可以兑换的超时时间，执行成功后，会先冻结用户对应资产到兑换池中。

```bash
hbtccli tx mapping createfreeswap [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| srcsymbol    | string | 源资产 |
| targetsymbol | string | 目标资产 |
| totalamount  | int    | 总共可兑换量，以最小精度为单位 |
| maxswapamount| int    | 最大可兑换量，以最小精度为单位 |
| minswapamount| int    | 最小兑换量，以最小精度为单位 |
| swapprice    | int    | 兑换价格，目标资产的数量，以最小精度为单位 |
| expiredtime  | int    | 超时时间，0为永不超时 |
| dec          | string | 兑换描述 |

#### 示例：添加btc/usdt的自由兑换

```bash
hbtccli tx mapping createfreeswap btc usdt 5000000 5000000 100000 1000000000000 0 myswap --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  创建定向闪兑

用户创建一个定向闪兑订单（类otc），可以设定自己订单的总共可以兑换数量，目标兑换资产，以及兑换人地址和订单可以兑换的超时时间，执行成功后，会先冻结用户对应资产到兑换池中，该订单只能被对应指定用户兑换。

```bash
hbtccli tx mapping createdirectswap [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| srcsymbol    | string | 源资产 |
| targetsymbol | string | 目标资产 |
| totalamount  | int    | 总共可兑换量，以最小精度为单位 |
| swapamount   | int    | 定向兑换币种数量，以最小精度为单位 |
| reciveaddr   | string | 定向闪兑目标用户 |
| expiredtime  | int    | 超时时间， 0为永不超时 |
| dec          | string | 兑换描述 |

#### 示例：添加btc/usdt的定向兑换

```bash
hbtccli tx mapping createdirectswap btc usdt 100000 10000000 HBCaViWTkR5GJek4Eme1R8h4GJhgYK4jHpiz 0 git --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  资产闪兑

用户指定对应的兑换单订单ID，输入自己兑换的数量，获取到对应的资产，兑换单创建人将获得兑换来的资产并减少兑换单剩余的资产数量（如果是定向兑换只支持一次性全部兑换）

```bash
hbtccli tx mapping swapsymbol [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| orderid      | string | 被兑换单的订单ID |
| swapamount   | int    | 定向兑换币种数量，以最小精度为单位 |
| swaptype     | int    | 兑换类型，0为自由兑换，1为定向兑换 |

#### 示例：自由兑换

```bash
hbtccli tx mapping swapsymbol 0 3000000 b8c48fbd-6183-403d-9779-ce3895c5e04d --home node/hbtccli --chain-id hbtc-testnet --from alice
```

#### 示例：定向兑换

```bash
hbtccli tx mapping swapsymbol 1 1000000 c96721bf-2d2b-440e-8db0-4f74f5f69410 --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  取消闪兑订单

用户可以主动取消未兑换完成订单，取消成功后，会把未兑换完成的资产返回到用户钱包中。超时订单也需要用户主动取消，系统不自动取消超时订单。

```bash
hbtccli tx mapping cancelswap [flags]
```
#### 参数说明

| 名称 | 类型  | 参数说明 | 
| ------ | ------ | ------ |
| orderid      | string | 被兑换单的订单ID |
| swaptype     | int    | 兑换类型，0为自由兑换，1为定向兑换 |

#### 取消兑换单

```bash
hbtccli tx mapping cancelswap 0 95a9db3a-1c04-4531-a8eb-e4af21b89131 --home node/hbtccli --chain-id hbtc-testnet --from alice
```

