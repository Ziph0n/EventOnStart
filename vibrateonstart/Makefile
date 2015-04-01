ARCHS = armv7 arm64

include theos/makefiles/common.mk

TARGET =: clang

BUNDLE_NAME = VibrateOnStart
VibrateOnStart_FILES = VibrateOnStart.mm CreditsPage.mm WelcomeText.mm Translators.mm $(shell find $(THEOS)/include/SettingsKit -name '*.m')
VibrateOnStart_INSTALL_PATH = /Library/PreferenceBundles
VibrateOnStart_PRIVATE_FRAMEWORKS = Preferences
VibrateOnStart_FRAMEWORKS = AudioToolbox UIKit AVFoundation MessageUI Social QuartzCore CoreGraphics


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.png $(THEOS_STAGING_DIR)/Library/PreferenceBundles/VibrateOnStart.bundle/$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/vibrateonstart.plist$(ECHO_END)
SUBPROJECTS += vibrateonstart
