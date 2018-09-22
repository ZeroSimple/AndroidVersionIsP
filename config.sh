##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# 设为true 如果你想挂载 Magic Mount
# 设成true就行了，不用管这是啥
AUTOMOUNT=true

# 如果你要修改system.prop 文件，请设为true
PROPFILE=false

# Set to true if you need post-fs-data script（这个啥我也不清楚，ture没坏处，不过false也差不多233）
POSTFSDATA=false

# 设成ture 如果你需要启用 late_start service script
LATESTARTSERVICE=false

##########################################################################################
# 下面填上你喜欢的模块名称
##########################################################################################

# 下面是设置你刷模块时要显示的内容，支持中文，不过如果要发布的话推荐写英语，语法我就不再扯了，大家都懂

print_modname() {
  ui_print "********************************************"
  ui_print "     Make Your Phone Just Like Pie    "
  ui_print "********************************************"
  ui_print "              by @ZeroSimple               "
  ui_print "********************************************"
  ui_print "This module will change your Android Version &"
  ui_print "security patch version into the newest."
  ui_print "Flash and enjoy it!"
  ui_print "Feedback: hqf0327@gmail.com"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

