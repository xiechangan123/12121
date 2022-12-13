#!/bin/bash
#
# Copyright (c) 2019-2023 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Modify China TimeZone
uci set system.@system[0].timezone=CST-8
uci set system.@system[0].zonename=Asia/Shanghai
uci commit system
# Modify default password
sed -i 's/root:::0:99999:7:::/root:$1$0MHbqDVw$FMCswXfbF5apRBrTWoVfA0:19333:0:99999:7:::/g' package/base-files/files/etc/shadow
# Modify disable dnsmasq from listening on pppoe-wan
uci add_list dhcp.@dnsmasq[0].notinterface='pppoe-wan'
uci commit dhcp
