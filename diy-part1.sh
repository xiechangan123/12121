#!/bin/bash
#
# Copyright (c) 2019-2023 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add packages
git clone https://github.com/xiechangan123/luci-app-xray package/luci-app-xray
git clone https://github.com/xiechangan123/luci-i18n-xray-zh-cn package/luci-i18n-xray-zh-cn
git clone https://github.com/immortalwrt/homeproxy package/homeproxy
