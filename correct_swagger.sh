#!/bin/bash

swagger='source/references/swagger.md'

# 删除前 20 行
sed -i '' '1,20d' ${swagger}

# 增加标题
sed -i '' '1i\
    # HBTCChain API' ${swagger}

# 修正 schema
sed -i '' 's/<h2 id.*>\(.*\)<\/h2>/## \1/g' ${swagger}
sed -i '' 's/^### Properties$/#### Properties/g' ${swagger}

# 按模块划分 api
sed -i '' 's/^## /### /g' ${swagger}
sed -i '' 's/<h1 id.*>\(.*\)<\/h1>/## \1/g' ${swagger}

# Schemas 放在二级
sed -i '' 's/^# Schemas$/## DataStructure/g' ${swagger}
