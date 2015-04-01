ARCHS = armv7 arm64

include theos/makefiles/common.mk

TARGET =: clang

TWEAK_NAME = VibrateOnStart
VibrateOnStart_FILES = Tweak.xm
VibrateOnStart_FRAMEWORKS = UIKit AVFoundation AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += vibrateonstart
include $(THEOS_MAKE_PATH)/aggregate.mk
