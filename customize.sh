#!/system/bin/sh
# ====================================
# Lithium v1.3 - Balanced
# ====================================

SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

ui_print ""
ui_print "  Lithium v1.3"
ui_print "  Advanced Balanced"
ui_print ""

# Safety check
if [ "$BOOTMODE" != true ]; then
  ui_print "! Install from Magisk app only"
  abort
fi

ui_print "- Bootmode confirmed"

# Runtime scheduler hints (NEW)
echo 0 > /proc/sys/kernel/sched_boost 2>/dev/null
echo 1 > /proc/sys/kernel/sched_prefer_idle 2>/dev/null

# Background app freezer (NEW)
settings put global cached_apps_freezer enabled 2>/dev/null

# Adaptive battery enforcement (NEW)
settings put global adaptive_battery_management_enabled 1 2>/dev/null

# I/O readahead optimization (NEW)
for block in /sys/block/*/queue/read_ahead_kb; do
  echo 128 > "$block" 2>/dev/null
done

# Reduce runtime logging (NEW)
setprop persist.sys.logkit.enable false
setprop log.tag.stats_log SUPPRESS

ui_print ""
ui_print "  Lithium v1.3 setup complete"
ui_print ""
