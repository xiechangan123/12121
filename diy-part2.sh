#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2025 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Modify default Password
sed -i 's/root:::0:99999:7:::/root:$1$0MHbqDVw$FMCswXfbF5apRBrTWoVfA0:19333:0:99999:7:::/g' package/base-files/files/etc/shadow

# Modify default TimeZone
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate
sed -i "/.*ttylogin='0'.*/i\		set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

# remove v2ray-geodata package from feeds (openwrt-22.03 & master)
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
