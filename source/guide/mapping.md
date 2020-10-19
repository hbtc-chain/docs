## 跨链资产映射

跨链资产映射可以将一条链的资产映射到另一条链上，例如，用户可以在 ETH 上发行 CBTC 的 ERC20 代币，然后通过 hbtcchain 将 BTC 主网币映射成 ETH 上的 CBTC。
具体步骤为：  
1. 在 ETH 链上发行 CBTC 代币，代币总量固定且不可增发和销毁。 
2. 以跨链资产转账的方式，将所有 CBTC 充值到 hbtcchain 链上，映射成 hbtcchain 的代币 CBTC  
3. 发起新增资产映射的提案，创建 BTC 到 CBTC 的映射对， 持有HBC的人可以投票这个映射对的安全合规问题（资产已经全部充入且智能合约经过安全审计）
4. 提案通过后，用户可以通过资产映射功能进行 BTC 和 CBTC 的一比一兑换，兑换完成后，可以通过跨链提现的方式，将资产转移到eth上并进行相关操作。
5. 用户可以把eth上面的CBTC提回到HBTC Chain上，然后再通过资产映射功能换回BTC，并可以自由体现到自己的BTC链上地址。

同理，我们可以把任意公链资产完全1:1锚定的方式带入到任意公链，实现资产的去中心化安全可靠流通。

### 1. 新增资产映射提案
命令：

```bash
hbtccli tx gov submit-proposal add-mapping [issue-symbol] [target-symbol] [total-supply] [flags]
```

新增资产映射提案前，需要确保发行的代币已经全部充值到提案发起者的账户。这里以 alice 为例：

```bash
$ hbtccli tx gov submit-proposal add-mapping hxbtc hbtc 2100000000000000 --deposit 10000000000000000000000 --from alice --chain-id hbtc-testnet --home node/hbtccli
```

提案通过以后，即可进行资产映射

### 2. 跨链资产映射兑换
命令：  

```bash
hbtccli tx mapping swap [issue-symbol] [coin] [flags]
```

示例：  
alice 兑换 1 个 btc 到 1 个 cbtc:  

```bash
hbtccli tx mapping swap cbtc 100000000btc --from alice --chain-id hbtc-testnet --home node/hbtccli
```

alice 兑换 1 个 cbtc 到 1 个 btc:  

```bash
hbtccli tx mapping swap btc 100000000cbtc --from alice --chain-id hbtc-testnet --home node/hbtccli
```

映射资产兑换完成之后，用户即可将获得的币通过提现功能，转移到对应的链上。