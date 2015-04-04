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

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Batagur"
            }

            TextField {
                id: master
                placeholderText: qsTr("master password")
                label: qsTr("master")
                width: page.width
                inputMethodHints: Qt.ImhNoPredictiveText
                echoMode: TextInput.Password
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: token.focus = true
            }

            TextField {
                id: token
                placeholderText: qsTr("service token")
                label: qsTr("token")
                width: page.width
                inputMethodHints: Qt.ImhNoPredictiveText
                echoMode: TextInput.Password
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                EnterKey.onClicked: {
                    var pass = BatagurQtHelper.batagur(
                                master.text,
                                SettingsHelper.value("salt", ""),
                                token.text,
                                SettingsHelper.value("iterations", 1111),
                                0,
                                SettingsHelper.value("length", 79))
                    master.text = ""
                    token.text = ""
                    pageStack.push(Qt.resolvedUrl("Password.qml"), {passwd: pass})
                }

            }

            Button {
                text: qsTr("generate")
                onClicked: {
                    var pass = BatagurQtHelper.batagur(
                                master.text,
                                SettingsHelper.value("salt", ""),
                                token.text,
                                SettingsHelper.value("iterations", 1111),
                                0,
                                SettingsHelper.value("length", 79))
                    master.text = ""
                    token.text = ""
                    pageStack.push(Qt.resolvedUrl("Password.qml"), {passwd: pass})
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
    }
}


