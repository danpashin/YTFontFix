TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = YouTube
FINALPACKAGE = 1
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTFontFix
${TWEAK_NAME}_LOGOS_DEFAULT_GENERATOR = internal
${TWEAK_NAME}_FILES = main.x
${TWEAK_NAME}_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
