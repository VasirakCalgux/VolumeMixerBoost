# VolumeMixerBoost: Advanced Volume Control for iOS (Rootless)
THEOS_PACKAGE_SCHEME = rootless

ifdef SIMULATOR
export TARGET = simulator:clang:latest:8.0
else
export TARGET = iphone:clang:16.5:14.5
export ARCHS = arm64 arm64e
endif

INSTALL_TARGET_PROCESSES = SpringBoard

# Main Tweak Configuration
TWEAK_NAME = VolumeMixerBoost

VolumeMixerBoost_FILES = Tweak.xm VMHookInfo.mm VMHookAudioUnit.mm 
VolumeMixerBoost_FILES += MRYIPC/MRYIPCCenter.m MRYIPC/mrybootstrap.m
VolumeMixerBoost_FRAMEWORKS = AudioToolbox AVFoundation CoreAudio CoreGraphics
VolumeMixerBoost_CFLAGS = -fobjc-arc -IMRYIPC/Include
VolumeMixerBoost_LIBRARIES += substrate
VolumeMixerBoost_LOGOSFLAGS += -c generator=MobileSubstrate

VolumeMixerBoost_FILES += TweakSB.xm VMHUDView.m VMHUDWindow.m VMHUDRootViewController.m VMLAListener.m VMLAVolumeDownListener.m VMLAVolumeUpListener.m
ifdef SIMULATOR
VolumeMixerBoost_FILES += sim.x
endif

# Preference Bundle & CC Module Configuration
BUNDLE_NAME = volumemixerboost CCVolumeMixerBoost

volumemixerboost_FILES = volumemixerpref/VMPrefRootListController.m volumemixerpref/BDInfoListController.m volumemixerpref/VMLicenseViewController.m volumemixerpref/VMAuthorListController.m
volumemixerboost_FILES += $(wildcard AltListDependencies/*.m) AltListDependencies/AltList.x
volumemixerboost_INSTALL_PATH = /Library/PreferenceBundles
volumemixerboost_FRAMEWORKS = UIKit MobileCoreServices
volumemixerboost_PRIVATE_FRAMEWORKS = Preferences
volumemixerboost_CFLAGS = -fobjc-arc -IAltListDependencies -Wno-tautological-pointer-compare
volumemixerboost_RESOURCE_DIRS = volumemixerpref/Resources

CCVolumeMixerBoost_BUNDLE_EXTENSION = bundle
CCVolumeMixerBoost_FILES = ccvolumemixer/CCVolumeMixer.m
CCVolumeMixerBoost_CFLAGS = -fobjc-arc
CCVolumeMixerBoost_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCVolumeMixerBoost_INSTALL_PATH = /Library/ControlCenter/Bundles/
CCVolumeMixerBoost_RESOURCE_DIRS = ccvolumemixer/Resources

export ADDITIONAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=unused-function -Wno-error=unused-value -Wno-deprecated-declarations -Wno-error=unavailable-declarations -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp volumemixerpref/entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/volumemixerboost.plist$(ECHO_END)
