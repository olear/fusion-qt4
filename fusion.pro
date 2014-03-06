# Fusion style plugin

QT       += core gui

TARGET = fusion
TEMPLATE = lib
CONFIG += plugin

# Set this variable to Qt sources directory
QTSRC = E:/Soft/QtSDK/QtSources/4.8.0/src

INCLUDEPATH += $$QTSRC/gui/styles

TARGET = $$qtLibraryTarget($$TARGET)
DESTDIR = $$[QT_INSTALL_PLUGINS]/styles

SOURCES += \
    qfusionstyle.cpp \
    qstyleanimation.cpp \
    fusionstyleplugin.cpp \
    $$QTSRC/gui/styles/qstylehelper.cpp

HEADERS += \
    qfusionstyle.h \
    qfusionstyle_p.h \
    qfusionstylepixmaps_p.h \
    qstyleanimation_p.h \
    fusionstyleplugin.h
	
RESOURCES += \
    fusion.qrc

win32: LIBS += -lgdi32

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}

symbian {
    load(data_caging_paths)
    MMP_RULES += EXPORTUNFROZEN
    TARGET.UID3 = 0xE31FC764
    TARGET.CAPABILITY = 
    TARGET.EPOCALLOWDLLDATA = 1
    pluginDeploy.sources = fusion.dll
    pluginDeploy.path = $$QT_PLUGINS_BASE_DIR/fusion
    DEPLOYMENT += pluginDeploy
}
