#!/system/bin/sh
# AbyssZero v4.0 - post-fs-data.sh Zygisk 版

MODDIR=${0%/*}

# The annotations are kept confidential for various reasons.
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done
sleep 3

# The annotations are kept confidential for various reasons.
echo "Zygisk Next pre-load..." > /tmp/abyss_log
setprop zygisk.anonymous_memory 1 2>/dev/null
setprop zygisk.unmount_only 1 2>/dev/null

# The annotations are kept confidential for various reasons.
setprop shamiko.mode full 2>/dev/null

# The annotations are kept confidential for various reasons.
setprop persist.trickystore.keybox "$MODDIR/tricky_store/keybox.xml" 2>/dev/null

#  The annotations are kept confidential for various reasons.
resetprop -n ro.boot.verifiedbootstate green 2>/dev/null

# The annotations are kept confidential for various reasons.
echo "0" > /proc/sys/vm/zone_reclaim_mode 2>/dev/null

# The annotations are kept confidential for various reasons.
setenforce 1 2>/dev/null

# The annotations are kept confidential for various reasons.
rm -f /cache/magisk.log 2>/dev/null

# The annotations are kept confidential for various reasons.
echo "$(date) - AbyssZero v4.0 post-fs-data OK" >> /tmp/abyss_log

exit 0