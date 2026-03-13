THEOS_PACKAGE_SCHEME = rootless

ifdef SIMULATOR
export TARGET = simulator:clang:latest:8.0
else
export TARGET = iphone:clang:latest:14.5
export ARCHS = arm64 arm64e
endif

INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = VolumeMixer

VolumeMixer_FILES = Tweak.xm VMHookInfo.mm VMHookAudioUnit.mm 
VolumeMixer_FILES += MRYIPC/MRYIPCCenter.m
VolumeMixer_CFLAGS = -fobjc-arc
VolumeMixer_LIBRARIES += substrate
VolumeMixer_LOGOSFLAGS += -c generator=MobileSubstrate

VolumeMixer_FILES += TweakSB.xm VMHUDView.m VMHUDWindow.m VMHUDRootViewController.m VMLAListener.m VMLAVolumeDownListener.m VMLAVolumeUpListener.m
ifdef SIMULATOR
VolumeMixer_FILES += sim.x
endif

BUNDLE_NAME = volumemixer CCVolumeMixer

volumemixer_FILES = volumemixerpref/VMPrefRootListController.m volumemixerpref/BDInfoListController.m volumemixerpref/VMLicenseViewController.m volumemixerpref/VMAuthorListController.m
volumemixer_INSTALL_PATH = /Library/PreferenceBundles
volumemixer_FRAMEWORKS = UIKit
volumemixer_PRIVATE_FRAMEWORKS = Preferences
volumemixer_CFLAGS = -fobjc-arc
volumemixer_EXTRA_FRAMEWORKS += AltList
volumemixer_RESOURCE_DIRS = volumemixerpref/Resources

CCVolumeMixer_BUNDLE_EXTENSION = bundle
CCVolumeMixer_FILES = ccvolumemixer/CCVolumeMixer.m
CCVolumeMixer_CFLAGS = -fobjc-arc
CCVolumeMixer_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCVolumeMixer_INSTALL_PATH = /Library/ControlCenter/Bundles/
CCVolumeMixer_RESOURCE_DIRS = ccvolumemixer/Resources

export ADDITIONAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=unused-function -Wno-error=unused-value -Wno-deprecated-declarations -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp volumemixerpref/entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/volumemixer.plist$(ECHO_END)
