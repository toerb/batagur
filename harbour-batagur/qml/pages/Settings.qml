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
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Settings"
            }

            TextField {
                id: salt
                placeholderText: qsTr("Salt")
                label: qsTr("Salt")
                width: page.width
                text: SettingsHelper.value("salt", "")
                inputMethodHints: Qt.ImhNoPredictiveText
                onTextChanged: SettingsHelper.setValue("salt", salt.text)
            }

            Slider {
                id: iterations
                value: SettingsHelper.value("iterations", 1111)
                minimumValue:1
                maximumValue:1111
                stepSize: 1
                width: parent.width
                valueText: value
                label: qsTr("Iterations")
                onReleased: SettingsHelper.setValue("iterations", iterations.value)
            }
            Slider {
                id: length
                value: SettingsHelper.value("length", 79)
                minimumValue:1
                maximumValue:79
                stepSize: 1
                width: parent.width
                valueText: value
                label: qsTr("Length")
                onReleased: SettingsHelper.setValue("length", length.value)
            }
        }
    }
}
