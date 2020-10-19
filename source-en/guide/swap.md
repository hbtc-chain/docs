## Cross-chain Assets Conversion (Cross-chain OTC)


Premise：can refer to the interaction with HBTC Chain, which needs user create custodian unit and deposit cross-chain assets respectively. The two conversion methods are supported currently are:
- Flexible Conversion （which user can create a conversion order by specified price)
- Oriented Conversion（which user can  a conversion order by specified party and amount）

###  Create Flexible Conversion 

User can create a flexible converstion order (similiar to OTC), set the total converting amount, target asset, conversion limit, and the expired time for conversion,  users' assets will be frozen into the conversion pool after excucted succesfully 

```bash
hbtccli tx mapping createfreeswap [flags]
```
#### Description of parameter 

| Name          | Type   | Description of parameter                                     |
| ------------- | ------ | ------------------------------------------------------------ |
| srcsymbol     | string | Source asset                                                 |
| targetsymbol  | string | Target asset                                                 |
| totalamount   | int    | Total amount for conversion,  in minimum precision           |
| maxswapamount | int    | Maximum conversion amount,in minimum precision               |
| minswapamount | int    | Minimum conversion amount,in minimum precision               |
| swapprice     | int    | Conversion price, the amount of target asset,in minimum precision |
| expiredtime   | int    | Expired time, 0 means valid all the time                     |
| dec           | string | Conversion description                                       |

#### 

#### Example: create a btc/usdt flexible conversion

```bash
hbtccli tx mapping createfreeswap btc usdt 5000000 5000000 100000 1000000000000 0 myswap --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  Create oriented conversion 

User can create an oriented converstion order (similiar to OTC), set the total converting amount, target asset, address of the conversion party, and the expired time for conversion,  users' assets will be frozen into the conversion pool after excucted succesfully, and this order can only be converted by the specified user. 

```bash
hbtccli tx mapping createdirectswap [flags]
```
#### Description of parameter

| Name         | Type   | Description of parameter                                     |
| ------------ | ------ | ------------------------------------------------------------ |
| srcsymbol    | string | Source asset                                                 |
| targetsymbol | string | Target asset                                                 |
| totalamount  | int    | Total amount for conversion, in minimum precision            |
| swapamount   | int    | Cconversion amount of the oriented conversion,in minimum precision |
| reciveaddr   | string | Target user for oriented conversion                          |
| expiredtime  | int    | Expired time, 0 means valid all the time                     |
| dec          | string | Conversion description                                       |

#### Example: create a btc/usdt oriented conversion

```bash
hbtccli tx mapping createdirectswap btc usdt 100000 10000000 HBCaViWTkR5GJek4Eme1R8h4GJhgYK4jHpiz 0 git --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  Asset Fast conversion

User specify the converted Order ID, input the mount for convertion, convertion order create will obtain converted assets and the remaining source asset amount will be decrease according (All source assets will be converted for oriented convertion order)



```bash
hbtccli tx mapping swapsymbol [flags]
```
#### Description of parameter

| Name       | Type   | Description of parameter                                     |
| ---------- | ------ | ------------------------------------------------------------ |
| orderid    | string | The converted Order ID                                       |
| swapamount | int    | The asset mount for oriented conversion,in minimum precision |
| swaptype   | int    | Convertion type, 0 means flexible convertion, 1 means oriented convertion |

#### Example：Flexible conversion

```bash
hbtccli tx mapping swapsymbol 0 3000000 b8c48fbd-6183-403d-9779-ce3895c5e04d --home node/hbtccli --chain-id hbtc-testnet --from alice
```

#### Example: Oriented Conversion

```bash
hbtccli tx mapping swapsymbol 1 1000000 c96721bf-2d2b-440e-8db0-4f74f5f69410 --home node/hbtccli --chain-id hbtc-testnet --from alice
```

###  Cancel conversion order

User can cancel the unconverted order himself/herself, the unconverted asets will be refunded into user's wallet after succesful convertion. The expired orders are needed to be cancled by user too rather than the system.

```bash
hbtccli tx mapping cancelswap [flags]
```
#### Description of parameter

| Name     | Type   | Description of parameter                                     |
| -------- | ------ | ------------------------------------------------------------ |
| orderid  | string | The converted Order ID                                       |
| swaptype | int    | Convertion type, 0 means flexible convertion, 1 means oriented convertion |

#### 

#### Cancel conversion order

```bash
hbtccli tx mapping cancelswap 0 95a9db3a-1c04-4531-a8eb-e4af21b89131 --home node/hbtccli --chain-id hbtc-testnet --from alice
```

