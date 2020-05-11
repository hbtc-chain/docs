## 跨链资产闪兑

当全节点与全网同步所有区块后，我们可以用命令行工具(hbtccli)与HBTC Chain进行交互，可以运行以下指令查询所有的命令。

```bash
$ hbtccli help
```

我们给出跨链资产充币，闪兑和提币的流程简介，用两个用户alice与bob为例介绍完整的交互流程。（假设我们的二进制运行在本机的node目录下,alice与bob为两个不同的用户）。

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
这样，alice就为自己离线创建了一个账户，同样,bob也按照相同的操作创建一个账户如下：
```json
{
  "name": "bob",
  "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
  "pubkey": "hbcpub1addwnpepqddz9uqphxcphs50j9ewqeccymkl66n2nqkes3h4w8xrna39qxm0jwk688c",
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
同样的原理，bob为自己创建了一个eth/usdt的跨链托管地址，其数据查询如下：
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
通过上述步骤，alice和bob分别创建了btc/eth相关的跨链地址，alice可以通过自己的钱包向自己的跨链btc地址(12ayvTjKBxZnScRoEZ67seVySsqD5JboaA)充入一定输了的btc，bob可以向自己的eth跨链地址(0xB48fEe1Df0Ae85415Eb286E66b262DA70BD94693)充入一定的eth和btc，充值完成后，HBTC Chain会自动扫描托管单元的跨链地址，把对应的充值记账到HBTC Chain 对应的托管单元上。比如，bob充值了0.5eth和100tusdt，查询对应托管单元的信息如下：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
    "coins": [
      {
        "denom": "eth",
        "amount": "500000000000000000"
      },
      {
        "denom": "usdt",
        "amount": "100000000"
      }
    ],
    "assets": [
      {
        "denom": "tusdt",
        "address": "0xB48fEe1Df0Ae85415Eb286E66b262DA70BD94693",
        "nonce": "0",
        "enable_sendtx": true
      },
      {
        "denom": "eth",
        "address": "0xB48fEe1Df0Ae85415Eb286E66b262DA70BD94693",
        "nonce": "2",
        "enable_sendtx": true
      }
    ],
}
```
可以很清晰的看到bob的托管单元里面已经有了对应的资产，同理，alice的账户也会有对应充值进去的btc资产。
### 4. 跨链资产闪兑
alice和bob分别充入了对应的btc和eth/usdt的资产，充值完成后（HBTC Chain链上资产可以查询验证）,alice决定和bob进行一次资产兑换，用alice的btc兑换bob的usdt，资产兑换的流程如下：
#### 1.构建闪兑交易
alice和bob可以分别在本地构建相同的兑换交易，alice用0.05btc和bob的100usdt进行兑换，其交易构建命令如下：
```bash
$ hbtccli tx transfer multisend HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q 5000000btc HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH 100000000usdt 0 --output-document swapmsg.json --home node/hbtccli
```
该命令执行后，会在当前执行目录下生成一个swapmsg.json的文件，文件内容为对应的交易内容。
#### 2.交易签名
交易构建完成后，alice和bob分别对该交易进行签名，交易签名的命令如下：
```bash
$  hbtccli tx sign swapmsg.json  --from HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q --home node/hbtccli --output-document alicesign.json
```
签名后的交易保存在当前只想目录下的alicesign.json里，其文件内容如下：
```json
{
  "type": "hbtcchain/StdTx",
  "value": {
    "msg": [
      {
        "type": "hbtcchain/transfer/MsgMultiSend",
        "value": {
          "inputs": [
            {
              "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
              "coins": [
                {
                  "denom": "btc",
                  "amount": "5000000"
                }
              ]
            },
            {
              "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
              "coins": [
                {
                  "denom": "usdt",
                  "amount": "100000000"
                }
              ]
            }
          ],
          "outputs": [
            {
              "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
              "coins": [
                {
                  "denom": "usdt",
                  "amount": "100000000"
                }
              ]
            },
            {
              "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
              "coins": [
                {
                  "denom": "btc",
                  "amount": "5000000"
                }
              ]
            }
          ],
          "max_height": "0"
        }
      }
    ],
    "fee": {
      "amount": [],
      "gas": "200000"
    },
    "signatures": [
      {
        "pub_key": {
          "type": "tendermint/PubKeySecp256k1",
          "value": "A0Ne419SfLkt0IMaPvkkUZI/nXev14NVqCaeJXfJSan8"
        },
        "signature": "jVd+LPWQLSUhKYCo2Rsn24NizEv5GwDafvtFZM5nuNEPZelRCJ5CbjeIv4DtsUL5HRd5Iy3GMrnjJhmSKMM5zA=="
      }
    ],
    "memo": ""
  }
}
```
同样，bob通过如下命令对该交易进行签名：
```bash
$  hbtccli tx sign exchangemsg.json  --from HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH --home node/hbtccli --output-document bobsign.json
```
bob和alice分别签名完成后，bob把签名信息发送给alice，alice把bob的的签名消息组装到交易里面去，放到交易的signatures里面，组装完成的交易后是：
```json
{
  "type": "hbtcchain/StdTx",
  "value": {
    "msg": [
      {
        "type": "hbtcchain/transfer/MsgMultiSend",
        "value": {
          "inputs": [
            {
              "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
              "coins": [
                {
                  "denom": "btc",
                  "amount": "5000000"
                }
              ]
            },
            {
              "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
              "coins": [
                {
                  "denom": "usdt",
                  "amount": "100000000"
                }
              ]
            }
          ],
          "outputs": [
            {
              "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
              "coins": [
                {
                  "denom": "usdt",
                  "amount": "100000000"
                }
              ]
            },
            {
              "address": "HBCcUCWJNattE5PYm6xQKbaCoRCG2SaVdHvH",
              "coins": [
                {
                  "denom": "btc",
                  "amount": "5000000"
                }
              ]
            }
          ],
          "max_height": "0"
        }
      }
    ],
    "fee": {
      "amount": [],
      "gas": "200000"
    },
    "signatures": [
      {
        "pub_key": {
          "type": "tendermint/PubKeySecp256k1",
          "value": "A0Ne419SfLkt0IMaPvkkUZI/nXev14NVqCaeJXfJSan8"
        },
        "signature": "jVd+LPWQLSUhKYCo2Rsn24NizEv5GwDafvtFZM5nuNEPZelRCJ5CbjeIv4DtsUL5HRd5Iy3GMrnjJhmSKMM5zA=="
      },
      {
        "pub_key": {
          "type": "tendermint/PubKeySecp256k1",
          "value": "A1oi8AG5sBvCj5Fy4GcYJu39amqYLZhG9XHMOfYlAbb5"
        },
        "signature": "/W9RJqOvx3RImGFzq7p02bw1oUW9S2L61tOCoF9TwwFAlHAKChf2HIwrwZjLUf3d81t6T4pR0L7ph4PiS2yKXw=="
      }
    ],
    "memo": ""
  }
}
```
我们交易组装后保存为swaptx.json。
#### 3.交易发送
```bash
$ hbtccli tx broadcast swaptx.json
```
通过该命令我们完成了alice和bob的交易，alice的0.05个btc交换到了bob的100usdt,交易完成后可以通过查看对应的托管单元的资产，比如alice的资产展示为：
```json
{
  "type": "hbtcchain/CustodianUnit",
  "value": {
    "address": "HBCPNuLKXuQSVgGe4kfF3JxJZb1Uytkajb3Q",
    "coins": [
      {
        "denom": "usdt",
        "amount": "100000000"
      }
    ],
}
```
可以看到，bob成功换到了100usdt，这样我们完成了资产闪兑。
#### 4.交易取消
存在一种情况，alice签名完成后，把签名后的信息发送给bob，但是由于一些别的原因，alice不想再继续交易，如果bob未把签名组装后的交易发送到链上，alice可以主动发送如下交易取消该交易，其命令如下：
```bash
$ hbtccli tx transfer cancel-uncommitted-tx alice --home node/hbtccli
```
另外，我们可以在组装兑换交易的时候，指定一个最大成交高度（为交易的第五个参数），如果超过该高度后交易发送到链上，交易也不会被成交（如果填0，则表示该交易不限制高度）。
### 5. 提出跨链资产
alice和bob交易完成后，alice想提出交易获取到的100usdt到自己的钱包中，则可以执行如下命令：
```bash
$ hbtccli tx transfer withdrawal alice 0xC933C741416151dAcFE9428d39222f747e2b45EB 100000000usdt 21000000000000000 --chain-id hbtc-testnet --home node/hbtccli
```
通过该命令，alice把自己通过交易获取到的100usdt提现到自己的eth账户(0xC933C741416151dAcFE9428d39222f747e2b45EB 非托管地址）上，通过一定区块高度后，用户可以在自己的钱包账户看到提现到账信息。（注：alice如果想提取usdt，需要在链上充入或者交易获取到一定的eth作为手续费）。
