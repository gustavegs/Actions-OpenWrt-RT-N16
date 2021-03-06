#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Modify default IP
#修改默认 IP为192.168.2.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify default SSID
#修改默认 SSID为RT-ACRH17
sed -i 's/OpenWrt/RT-N16/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default wifi 低速率 MU-MIMO 剔除
#修改默认 
sed -i '/country/a \\t\t\tset wireless.radio${devidx}.legacy_rates=0 \n \t\t\tset wireless.radio${devidx}.txpower=20' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/ssid/a \\t\t\tset wireless.default_radio${devidx}.disassoc_low_ack=0' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#删除默认密码
#sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
#删除原主题	
#rm -rf package/lean/luci-theme-argon

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#添加主题
#git clone https://github.com/sypopo/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git       #取消注释下载最新的argon主题
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git package/luci-theme-opentomato

#添加额外软件包
git clone https://github.com/cnzd/luci-app-koolproxyR.git package        #去广告最新KPR
git clone https://github.com/xiaorouji/openwrt-package.git xiaorouji     #常用软件集合包
git clone https://github.com/kenzok8/openwrt-packages.git                #常用软件集合包二
git clone https://github.com/destan19/OpenAppFilter.git                  #APP过滤应用

