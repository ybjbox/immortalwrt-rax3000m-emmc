#更改后台地址
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# echo '修改机器名称'
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# echo '修改wifi名称'
sed -i 's/ImmortalWrt/YBJ/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# echo '修改时区'
# sed -i "s/'UTC'/'CST-8'\n set system.@system[-1].zonename='亚洲\/上海'/g" package/base-files/files/bin/config_generate

# echo '修改默认主题'
# sed -i 's/config 内部主题/配置内部主题\n 选项 Argon \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# echo '默认bootstrap主题'
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# echo '删除旧版argon,链接新版'
# rm -rf ./package/lean/luci-theme-argon
# ln -s ../../../luci-theme-argon ./package/lean/

# echo '修改横幅'
# rm -rf package/base-files/files/etc/banner
# cp -f ../横幅包/base-files/files/etc/

# echo '集成diy目录'
# ln -s ../../diy ./package/openwrt-packages

# echo '下载ServerChan'
# git 克隆 https://github.com/tty228/luci-app-serverchan ../diy/luci-app-serverchan
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

# 预置openclash内核
mkdir -p files/etc/openclash/core


# dev内核
CLASH_DEV_URL="https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux-arm64.tar.gz"
# premium内核
#CLASH_TUN_URL="https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux-arm64-2023.08.17-13-gdcc8d87.gz"
# Meta内核版本
CLASH_META_URL="https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux-arm64.tar.gz"

wget -qO- $CLASH_DEV_URL | gunzip -c > files/etc/openclash/core/clash
#wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta
# 给内核权限
chmod +x files/etc/openclash/core/clash*

# meta 要GeoIP.dat 和 GeoSite.dat
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# Country.mmdb
COUNTRY_LITE_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/lite/Country.mmdb
# COUNTRY_FULL_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb
wget -qO- $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb
# wget -qO- $COUNTRY_FULL_URL > files/etc/openclash/Country.mmdb
