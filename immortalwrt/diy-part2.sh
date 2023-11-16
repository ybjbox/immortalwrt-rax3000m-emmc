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

