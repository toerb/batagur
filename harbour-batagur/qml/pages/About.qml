/*
 The MIT License (MIT)
 Copyright (c) 2015 toerb
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("About")
            }
            Image {
                source: "/usr/share/icons/hicolor/86x86/apps/harbour-batagur.png"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                text: "Version 0.9.1"
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                text: "© toerb (batagur@toerb.de)"
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                text: qsTr("Issues") + ": <a href=\"https://github.com/toerb/batagur\">GitHub</a>"
                wrapMode: Text.WordWrap
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                font.family: Theme.fontFamilyHeading
                color: Theme.highlightColor
                text: qsTr("Passwords")
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                font.pixelSize: Theme.fontSizeSmall
                width: page.width
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                wrapMode: Text.WordWrap
                text: qsTr("PasswordsText")
            }
            Label {
                font.family: Theme.fontFamilyHeading
                color: Theme.highlightColor
                text: qsTr("Licences")
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                font.pixelSize: Theme.fontSizeSmall
                width: page.width
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                wrapMode: Text.WordWrap
                text: qsTr("LicencesText")
            }
        }

        VerticalScrollDecorator { }

    }
}
