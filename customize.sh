#!/system/bin/sh

ui_print " "
ui_print "****************************"
ui_print "  Lithium - Magisk Module  "
ui_print "****************************"
ui_print " "
ui_print "A small battery & performance module"
ui_print "Made for learning purposes"
ui_print " "

set_perm_recursive $MODPATH 0 0 0755 0644
