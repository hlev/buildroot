################################################################################
#
# WPEFramework Plugins
#
################################################################################

WPEFRAMEWORK_PLUGINS_VERSION = 1b5ce10a4420e832e11c3a0bdcb45cfe9633c08d
WPEFRAMEWORK_PLUGINS_SITE_METHOD = git
WPEFRAMEWORK_PLUGINS_SITE = git@github.com:WebPlatformForEmbedded/WPEFrameworkPlugins.git
WPEFRAMEWORK_PLUGINS_INSTALL_STAGING = YES
WPEFRAMEWORK_PLUGINS_DEPENDENCIES = wpeframework libpng

WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_PLUGINS_VERSION} -DWPEFRAMEWORK_WEB_UI=ON

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif

# libprovision

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMMANDER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_COMMANDER=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_DEVICEINFO=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_EGLTEST),y)
WPEFRAMEWORK_COMMON_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_EGLTEST=ON
endif


ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_LOCATIONSYNC=ON
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_LOCATIONSYNC_URI=${BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC_URI}
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_MONITOR=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IR),y)
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IRNEXUS),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_IRNEXUS=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IRNEXUS_MODE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_IRMODE="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IRNEXUS_MODE))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IRNEXUS_CODEMASK),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_CODEMASK="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_IRNEXUS_CODEMASK))"
endif
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_REMOTECONTROL_RF),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_RF=ON
endif
ifneq ($(BR2_TARGET_GENERIC_HOSTNAME),"buildroot")
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_REMOTECONTROL_HOST="$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))"
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_SNAPSHOT),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += libpng
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_SNAPSHOT=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TIMESYNC),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TIMESYNC=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TRACECONTROL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TRACECONTROL=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += wpewebkit
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_AUTOSTART),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_AUTOSTART=true
else
WPEFRAMEWORK_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_AUTOSTART=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_STARTURL=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEMORYPROFILE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEMORYPRESSURE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEDIADISKCACHE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_MEDIADISKCACHE=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_DISKCACHE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_XHRCACHE),)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_XHRCACHE=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_TRANSPARENT),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_TRANSPARENT=true
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_TRANSPARENT=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBKITBROWSER_YOUTUBE=ON
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBPROXY),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBPROXY=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBSERVER),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBSERVER=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBSHELL),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WEBSHELL=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WIFI),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_WIFISETUP=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TUNER),y)
ifeq ($(BR2_PACKAGE_RPI_FIRMWARE), y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += dvb-apps
endif
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TUNER=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TUNER_DVB),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TUNER_DVB=true
else
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_TUNER_DVB=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_SICONTROL),y)
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_TUNER_DVB),y)
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += dvb-apps
endif
WPEFRAMEWORK_PLUGINS_DEPENDENCIES += sqlite
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_SICONTROL=ON
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_RPCLINK),y)
WPEFRAMEWORK_PLUGINS_CONF_OPTS += -DWPEFRAMEWORK_PLUGIN_RPCLINK=ON
endif

$(eval $(cmake-package))
