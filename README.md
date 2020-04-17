# HBTC Chain 霍比特链文档

# 环境配置

```bash
$ pip3 install -U sphinx
$ pip3 install sphinx_markdown_tables
$ pip3 install recommonmark
$ pip3 install sphinx_rtd_theme
```

# 编译

```bash
$ make html
```

然后在浏览器中打开 build/html/index.html

# 生成 rpc 文档
## 安装 widdershins
```bash
$ npm install -g widdershins
```
## 生成文档
```bash
$ make swagger
```
