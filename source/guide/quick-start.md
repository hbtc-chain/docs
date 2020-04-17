# 快速启动

由于测试网在快速迭代开发中，我们现在提供预编译好的可执行文件，请通过[官方渠道](https://github.com/hbtc-chain/testnet)下载，目前测试网使用的软件版本为 v0.1.3。

**测试网的跨链资产目前支持BTC/ETH主网，以及ERC20 USDT等代币，充入其他资产将无法找回，请谨慎操作。**

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

#### 使用 docker 启动
进入 testnet 项目，执行命令

```
docker-compose -f docker-compose.yml up -d
```

成功后会在本地启动 hbtcd 容器并连接到测试网络。

