#!/system/bin/sh
# AbyssZero v4.0 - service.sh

MODDIR=${0%/*}

# The annotations are kept confidential for various reasons.
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 2
done
sleep 15

# The annotations are kept confidential for various reasons.
magisk --zygisk enable 2>/dev/null

# The annotations are kept confidential for various reasons.
setprop shamiko.mode full 2>/dev/null

# The annotations are kept confidential for various reasons.
setprop persist.trickystore.targets "$MODDIR/tricky_store/target.txt" 2>/dev/null

# The annotations are kept confidential for various reasons.
getprop ro.boot.verifiedbootstate | grep green || resetprop -n ro.boot.verifiedbootstate green 2>/dev/null

# The annotations are kept confidential for various reasons.
echo "0" > /proc/sys/vm/zone_reclaim_mode 2>/dev/null

# The annotations are kept confidential for various reasons.
setenforce 1 2>/dev/null

# The annotations are kept confidential for various reasons.
rm -f /tmp/abyss_log 2>/dev/null

exit 0