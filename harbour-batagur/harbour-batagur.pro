# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-batagur

CONFIG += sailfishapp

SOURCES += src/harbour-batagur.cpp \
    src/batagur.cpp \
    src/sha2.c

OTHER_FILES += qml/harbour-batagur.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-batagur.changes.in \
    rpm/harbour-batagur.spec \
    rpm/harbour-batagur.yaml \
    translations/*.ts \
    harbour-batagur.desktop \
    qml/pages/Input.qml \
    qml/pages/Password.qml \
    qml/pages/About.qml \
    qml/pages/Settings.qml \
    translations/harbour-batagur-en.ts

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-batagur-de.ts
TRANSLATIONS += translations/harbour-batagur-en.ts

HEADERS += \
    src/base91.hpp \
    src/batagur-qt.hpp \
    src/batagur.hpp \
    src/sha2.h \
    src/qtsettings.hpp

