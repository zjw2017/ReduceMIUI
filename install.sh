SKIPMOUNT=false
# 如果您需要加载system.prop，请将其设置为true
PROPFILE=false
# 如果您需要post-fs-data脚本（post-fs-data.sh），请将其设置为true
POSTFSDATA=true
# 如果您需要late_start服务脚本（service.sh），请将其设置为true
LATESTARTSERVICE=true
# 模块版本号
version="2.1.2"
# 模块精简列表更新日期
update_date="20.2.9"
# Zram调整配置(默认关闭)
enable_zram="0"
REPLACE="
/system/app/AnalyticsCore
/system/app/BasicDreams
/system/app/BookmarkProvider
/system/app/BuiltInPrintService
/system/app/CarrierDefaultApp
/system/app/CertInstaller
/system/app/FidoAuthen
/system/app/FidoClient
/system/app/greenguard
/system/app/KSICibaEngine
/system/app/mab
/system/app/MiuiDaemon
/system/app/MiuiVpnSdkManager
/system/app/MiWallpaper
/system/app/MSA
/system/app/PrintSpooler
/system/app/QColor
/system/app/Qmmi
/system/app/Stk
/system/app/TouchAssistant
/system/app/Traceur
/system/app/TranslationService
/system/app/WMService
/system/app/Xman
/system/app/Yman
/system/app/YouDaoEngine
/system/priv-app/MiRcs
/system/priv-app/MiGameCenterSDKService
/system/priv-app/MiuiFreeformService
/system/priv-app/MiService
/system/product/app/datastatusnotification
/system/product/app/PhotoTable
/system/product/app/QdcmFF
/system/product/app/talkback
/system/product/app/xdivert
/system/product/priv-app/dpmserviceapp
/system/product/priv-app/EmergencyInfo
/system/product/priv-app/seccamservice
/system/data-app
/system/vendor/data-app
"
costom_setttings(){
# 写入更新日期
  echo -n "$update_date" >> $TMPDIR/module.prop
# Zram调整配置
  if [ $enable_zram = "0" ] ; then
    rm -f /data/adb/modules_update/Reducemiui_mix2s/system/etc/mcd_default.conf
  else
    echo -n "(已启用Zram调整)" >> $TMPDIR/module.prop
  fi
# 写入版本号
  echo -e "\nversion=$version" >> $TMPDIR/module.prop
}

on_install(){
  ui_print "- 提取模块文件"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}
  on_install
  ui_print "*******************"
  ui_print "    Reduce MIUI   "
  ui_print "*******************"
  costom_setttings