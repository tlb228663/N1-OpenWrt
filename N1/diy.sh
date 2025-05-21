#!/bin/bash

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 clone/passwall
git clone https://github.com/jerrykuku/luci-theme-argon --depth=1 package/luci-theme-argon
git clone  https://github.com/linkease/luci-app-linkease --depth=1 package/linkease
git clone  https://github.com/gdy666/luci-app-lucky.git --depth=1 package/lucky

# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/passwall/luci-app-passwall feeds/luci/applications/
echo "

# 插件
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-linkease=y
CONFIG_PACKAGE_luci-app-lucky=y
" >> .config

# 修改默认主题
sed -i 's/luci-theme-design/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone

# 修改默认IP
# sed -i 's/192.168.1.1/192.168.0.2/g' package/base-files/files/bin/config_generate
