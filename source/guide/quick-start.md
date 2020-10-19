# 快速启动

由于测试网在快速迭代开发中，我们现在提供预编译好的可执行文件，请通过[官方渠道](https://github.com/hbtc-chain/testnet)下载，目前测试网使用的软件版本为 v0.9.0。

**测试网的跨链资产目前支持BTC/ETH/TRX主网，以及ERC20 USDT, LINK, HT 和 TRC20 USDT 代币，充入其他资产将无法找回，请谨慎操作。**

## 加入霍比特链测试网
克隆[testnet 项目](https://github.com/hbtc-chain/testnet)到本地:

```
git clone https://github.com/hbtc-chain/testnet.git
```

### 设置配置文件与创世文件
将 testnet 中的 config 目录拷贝到本地的 `$HOME/hbtcchain/node` 目录下。在 `$HOME/hbtcchain/node/config/config.toml` 配置文件中对节点的别名 `moniker` 进行编辑：  

```
# A custom human readable name for this node
moniker = "<your_custom_moniker>"
```

### 启动节点
#### 使用二进制程序启动
进入 `$HOME/hbtcchain/node` 目录，将 testnet 中的可执行文件 hbtcd 拷贝到本目录，然后执行如下命令启动:

```
./hbtcd start --home ./
```

## 与霍比特链进行交互

当全节点与全网同步所有区块后，我们可以用命令行工具(hbtccli)与HBTC Chain进行交互，可以运行以下指令查询所有的命令。

```bash
$ hbtccli help
```

我们给出跨链资产充币，转账和提币的流程简介，注意以下操作交互的是以太坊主网，请谨慎操作。

### 1. 创建和管理霍比特链托管单元
```bash
$ hbtccli keys add alice --home node/hbtccli
```
通过该命令我们在指定的node目录下创建了一个alice的托管单元（创建过程中需要输入你的密码对托管单元密钥进行加密存储），创建成功后展示如下：
```json
{
  "name": "alice",
  "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
  "pubkey": "hbcpub1addwnpepqdp4ac6l2f7tjtwssvdra7fy2xfrl8th4ltcx4dgy60z2a7ffx5lcu2ja8v",
}
```

### 2. 创建以太坊的跨链托管地址
```bash
$ hbtccli tx keygen keygen alice eth HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q  --chain-id hbtc-testnet --home node/hbtccli
```
通过这个命令我们为alice创建eth跨链托管单元地址，命令发送执行后等待2-3个区块后（密钥的分布式生成需要一定的时间），我们通过下面的命令查询对应的托管单元信息，可以获取到eth的跨链托管地址：
```bash
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
        "denom": "eth",
        "address": "0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B",
        "enbale_sendtx": true
      }
    ],
    "asset_pubkey": "A/dbw3DsU9HGTnglann9ZvlGl1gCPsC+8/2gWNrjhcQ3"
  }
}
```
从查询到的信息看，我们为托管单元在创建了一个eth的跨链托管地址(0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B)，并且这个地址的密钥由各个记账人节点分布式保存其中的分片，公钥在托管单元上可见（assert_pubkey)。

### 3. 充入跨链资产
生成可以向自己的eth跨链地址(0x97efBEAd089c9B57C4d5ed4a57d4ebBE3659d34B)充入一定的eth，充值完成后，HBTC Chain会自动扫描托管单元的跨链地址，把对应的充值记账到HBTC Chain 对应的托管单元上。比如，alice充值了0.5eth，查询对应托管单元的信息如下：
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

### 4. 跨链资产转账
```bash
$ hbtccli tx send alice  BHccpSzNbAPue6QBTfN8259t12CfxC9NY2K  100000000000000000eth --chain-id hbtccli-testnet --home node/hbtccli
```
通过该命令我们将当前的托管单元充值的0.5eth向另外一个托管地址转出了0.1eth，对方的账户会增加0.1eth的资产。

### 5. 提出跨链资产
```bash
$ hbtccli tx transfer withdrawal alice 0xC933C741416151dAcFE9428d39222f747e2b45EB 200000000000000000eth 21000000000000000 --chain-id hbtc-testnet --home node/hbtccli
```
通过该命令，托管用户alice把自己账户中的0.2eth提现到自己的eth账户(0xC933C741416151dAcFE9428d39222f747e2b45EB 非托管地址）上，通过一定区块高度后，用户可以在自己的账户看到提现到账信息。

### 6. 取消提现
```bash
$ hbtccli tx transfer cancelwithdrawal alice abe0f640-9fbe-4456-9873-fd402b90b044 --chain-id hbtc-testnet --home node/hbtccli
```
通过该命令，托管用户alice可以取消掉刚才发出的提现命令（用户的提现操作未到分布式签名阶段），取消提现后，提现需要的资金和手续费都会返回到用户账户中。

