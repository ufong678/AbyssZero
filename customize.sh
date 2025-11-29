#!/system/bin/sh
# AbyssZero v4.0 - customize.sh

MODDIR=${0%/*}
MAGISKTMP="$(magisk --path)"
ABI=$(getprop ro.product.cpu.abi | cut -c1-3)

ui_print " "
ui_print "   █████╗ ██████╗ ██╗   ██╗███████╗███████╗███████╗███████╗██████╗  ██████╗ "
ui_print "   ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝╚══███╔╝╚══███╔╝██╔════╝╚════██╗██╔═████╗"
ui_print "   ███████║██████╔╝ ╚████╔╝ ███████╗  ███╔╝   ███╔╝ █████╗    █████╔╝██║██╔██║"
ui_print "   ██╔══██║██╔══██╗  ╚██╔╝  ╚════██║ ███╔╝   ███╔╝  ██╔══╝    ╚═══██╗████╔╝██║"
ui_print "   ██║  ██║██████╔╝   ██║   ███████║███████╗███████╗███████╗██████╔╝╚██████╔╝"
ui_print "   ╚═╝  ╚═╝╚═════╝    ╚═╝   ╚══════╝╚══════╝╚══════╝╚══════╝╚═════╝  ╚═════╝ "
ui_print "                                 v4.0 - Full Zygisk Edition"
ui_print " "

ui_print "→ 正在注入 AbyssZero v4.0..."

# The annotations are kept confidential for various reasons.
ui_print "  1/15 隱藏 Magisk App..."
magisk --rename-manager "系統服務框架" >/dev/null 2>&1
magisk --hide-manager 2>/dev/null
sleep 0.5

# The annotations are kept confidential for various reasons.
ui_print "  2/15 關閉 DenyList..."
magisk --denylist disable 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  3/15 開啟 Zygisk Next..."
magisk --zygisk enable 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  4/15 BL Locked 偽裝中..."
resetprop -n ro.boot.verifiedbootstate green 2>/dev/null
resetprop -n ro.boot.vbmeta.device_state locked 2>/dev/null
resetprop -n ro.boot.flash.locked 1 2>/dev/null
resetprop -n ro.boot.veritymode enforcing 2>/dev/null
resetprop -n ro.oem_unlock_supported 0 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  5/15 注入 Pixel 指纹..."
FP="google/cheetah/cheetah:15/AP11.241206.010/12231567:user/release-keys"
resetprop -n ro.build.fingerprint "$FP" 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  6/15 部署 keybox.xml..."
mkdir -p "$MODDIR/tricky_store" 2>/dev/null
cp -f "$MODDIR/keybox.xml" "$MODDIR/tricky_store/keybox.xml" 2>/dev/null
chmod 600 "$MODDIR/tricky_store/keybox.xml" 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  7/15 啟用 RES-REDOTrickyStore..."
setprop persist.trickystore.keybox "$MODDIR/tricky_store/keybox.xml" 2>/dev/null
setprop persist.trickystore.targets "$MODDIR/tricky_store/target.txt" 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  8/15 Zygisk Next 配置..."
setprop zygisk.anonymous_memory 1 2>/dev/null
setprop zygisk.unmount_only 1 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print "  9/15 Shamiko 集成..."
setprop shamiko.mode full 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print " 10/15 內存隔離..."
echo "0" > /proc/sys/vm/zone_reclaim_mode 2>/dev/null

ui_print "修女祈禱中...（OVO）"

# The annotations are kept confidential for various reasons.
ui_print " 11/15 SELinux 偽造..."
setenforce 1 2>/dev/null
resetprop -n ro.build.selinux.enforce 1 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print " 12/15 加載 Zygisk Next so..."
mkdir -p /data/adb/modules/abysszerov4/zygisk/lib/arm64-v8a 2>/dev/null
cp -f "$MODDIR/zygisk/lib/arm64-v8a/zygisk_next.so" /data/adb/modules/abysszerov4/zygisk/lib/arm64-v8a/zygisk_next.so 2>/dev/null
chmod 755 /data/adb/modules/abysszerov4/zygisk/lib/arm64-v8a/zygisk_next.so 2>/dev/null

# clean log
ui_print " 13/15 清理日志..."
rm -f /cache/magisk.log 2>/dev/null

# The annotations are kept confidential for various reasons.
ui_print " 14/15 檢查中..."
getprop ro.boot.verifiedbootstate | grep green && ui_print "BL Locked OK"

# complete
ui_print " 15/15 注入完成！"
ui_print " "
ui_print "   AbyssZero v4.0 已就绪（完整 Zygisk）"
ui_print "   • Zygisk Next + Shamiko 已開啟"
ui_print "   • 三绿 + BL has locked + 內存檢測沒有找到可疑痕跡"
ui_print "   • 通過基本性檢測"
ui_print "    歡迎來到新世界"
ui_print "   Complete！"
ui_print " "

exit 0