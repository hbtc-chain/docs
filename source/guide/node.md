# 节点运营&部署

## 支持平台

  HBTCChain全节点目前支持包括Windows、Unix环境（mac OS、ubuntu、centos)等

## 基础配置需求

- 4核8Gb以上内存以及500Gb以上的磁盘空间
- 至少2MB/s的稳定互联网接入带宽
- 尽量部署在AWS服务器环境上

## 节点类型

### 普通节点 
负责转发区块和交易，对外提供 RPC 服务

普通节点不限制数量

### 共识节点 
负责打包交易，参与区块共识

数量不固定，目前最大限制35个，质押的 token 数量在整个质押列表的前35即可且不少于10W个 HBC

### 核心节点 
除了承担共识节点的职责，还负责跨链相关的所有操作，包括分布式密钥生成&签名，跨链交易验证&发送。

核心节点数量目前初始设置为7个节点，后续可以动态调整。

#### 运营核心节点需求
- 抵押资产数量处于前列（当前要求前7）且不少于50W个 HBC
- 区块链节点和清算服务节点分别不同机器部署（机器配置参考上述要求）
- 清算服务节点不需要开通公网访问权限，数据需要做好备份
- 需要部署具备完整的公链全节点（比如eth/btc/tron等）

## 设置配置文件与创世文件

将 mainnet 中的 config 目录拷贝到本地的 `$HOME/hbtcchain/node` 目录下。在 `$HOME/hbtcchain/node/config/config.toml` 配置文件中对节点的别名 `moniker` 进行编辑：

```
# A custom human readable name for this node
moniker = "<your_custom_moniker>"
```

## 启动节点

#### 使用二进制程序启动

进入 `$HOME/hbtcchain/node` 目录，将 mainnet 中的可执行文件 拷贝到本目录

普通节点以及共识节点执行如下命令 

```
./hbtcd start --home ./
```

核心节点需要额外执行如下命令

```
./bhsettled start --home ./
```
#### 使用 docker 启动

进入 mainnet 项目，执行命令

普通节点以及共识节点执行如下命令 

```
docker-compose -f docker-compose-chain.yml up -d
```
核心节点需要额外执行如下命令
```
docker-compose -f docker-compose-settle.yml up -d
```


#### 使用 源码 启动

首安装golang环境

进入 对应的工程 项目目录，编译出二进制文件

```
cd bhchain/cmd/hbtcd
go build
cd ../../bhsettle/cmd/bhsettled
go build
```

之后步骤同二进制程序启动

