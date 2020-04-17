## 跨链资产映射

当全节点与全网同步所有区块后，我们可以用命令行工具(hbtccli)与HBTC Chain进行交互，可以运行以下指令查询所有的命令。

```bash
$ hbtccli help
```

我们给出跨链资产充币，产映射和提币的流程简介，以用户alice为例介绍抵押0.01btc并发行得到0.01cbtc（以太坊ERC20 cBTC）的交互流程。（假设我们的二进制运行在本机的node目录下,alice为其中一个用户）。

### 1. 创建和管理HBTC Chain托管单元
```bash
$ hbtccli keys add alice --home node/hbtccli
```
通过该命令我们在指定的node目录下创建了一个alice的托管单元（创建过程中需要输入你的密码对托管单元密钥进行加密存储），创建成功后展示如下：
```json
{
  "name": "alice",
  "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
  "pubkey": "hbtpub1addwnpepqdp4ac6l2f7tjtwssvdra7fy2xfrl8th4ltcx4dgy60z2a7ffx5lcu2ja8v",
}
```

**完成这个操作后需要向HBTC Chain申请一定的hbc用来测试，具体申请方式请参考FAQ。**

### 2. 创建比特币和以太坊的跨链托管地址
首先，为alice托管单元创建一个BTC的跨链托管地址，操作命令如下：
```bash
$ hbtccli tx keygen keygen alice btc HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q  --chain-id hbtc-testnet --home node/hbtccli
```
通过这个命令alice创建了一个btc跨链托管单元地址，命令发送执行后等待2-3个区块后（密钥的分布式生成需要一定的时间），我们通过下面的命令查询对应的托管单元信息，可以获取到alice的btc跨链托管地址：
```
$ hbtccli query cu cuinfo HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q --chain-id hbtc-testnet --home node/hbtccli
```
查询的结果展示为：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
    "assets": [
      {
        "denom": "btc",
        "address": "12ayvTjKBxZnScRoEZ67seVySsqD5JboaA",
        "enable_sendtx": true
      }
    ],
  }
}
```
从查询到的信息看，为alice托管单元在创建了一个btc的跨链托管地址(mtZQH3wjTGu8FgPrS7B6gicay4kcPVa1wa)，并且这个地址的密钥由各个记账人节点分布式保存其中的分片。
同样的原理，alice又为自己创建了一个eth/usdt的跨链托管地址，其数据查询如下：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
    "assets": [
      {
        "denom": "usdt",
        "address": "0xB48fEe1Df0Ae85415Eb286E66b262DA70BD94693",
        "nonce": "0",
        "enable_sendtx": true
      },
      {
        "denom": "eth",
        "address": "0xB48fEe1Df0Ae85415Eb286E66b262DA70BD94693",
        "nonce": "0",
        "enable_sendtx": true
      }
    ],
  }
}
```
### 3. 充入跨链资产
通过上述步骤，alice创建了btc/eth相关的跨链地址，alice可以通过自己的钱包向自己的跨链btc地址(12ayvTjKBxZnScRoEZ67seVySsqD5JboaA)充入一定输了的btc，充值完成后，HBTC Chain会自动扫描托管单元的跨链地址，把对应的充值记账到HBTC Chain 对应的托管单元上。比如，alice充值了0.01btc和0.1 eth，查询对应托管单元的信息如下：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
    "coins": [
      {
        "denom": "btc",
        "amount": "1000000"
      },
      {
        "denom": "eth",
        "amount": "10000000000000000",
      },
      {
        "denom": "hbc",
        "amount": "10000000000000000000"
      }
    ]
  }
}
```
可以很清晰的看到alice的托管单元里面已经有了对应的资产。

### 4. 资产映射

alice可以通过已有的cbc资产映射合约将冲入的0.01btc映射发行为ERC20的0.01cbtc。资产映射发行的命令如下：

```bash
$ hbtccli tx mapping swap cbtc 1000000btc --from alice --chain-id hbtc-testnet --home node/hbtccli
```

通过该命令我们完成了alice的映射交易，alice的0.01个btc交换到了0.01个cbtc。交易完成后可以通过查看对应的托管单元的资产，比如alice的资产展示为：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
    "coins": [
      {
        "denom": "cbtc",
        "amount": "100000"
      }
    ],
}
```
可以看到，btc已经全部抵押，alice成功映射发行给自己0.01cbtc

### 5. 提出跨链资产
alice完成资产映射交易后，alice想提出交易获取到的0.01cbtc到自己的钱包中，则可以执行如下命令：
```bash
hbtccli tx transfer withdrawal alice 0xC933C741416151dAcFE9428d39222f747e2b45EB 100000cbtc 21000000000000000 --chain-id hbtc-testnet --home node/hbtccli
```
通过该命令，alice把自己通过获取到的0.01cbtc提现到自己的eth账户(0xC933C741416151dAcFE9428d39222f747e2b45EB 非托管地址）上，通过一定区块高度后，用户可以在自己的钱包账户看到提现到账信息。（注：alice如果想提取cbtc，需要在链上充入或者交易获取到一定的eth作为手续费）。
