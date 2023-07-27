

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import TeslaUIDemo
import QtQuick.Layouts
import "ui/BottomBar"
import "ui/LeftScreen"
import "ui/RightScreen"

GridLayout {
    id: mainRectangle
    anchors.fill: parent
    columns: 12
    rows: 10
    columnSpacing: 0
    rowSpacing: 0
    width: Constants.width
    height: Constants.height


    LeftScreen {
        id: leftScreen
        Layout.row: 0
        Layout.column: 0
        Layout.rowSpan: 10
        Layout.columnSpan: 4
        Layout.preferredWidth: 4
        Layout.preferredHeight: 10
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    RightScreen {
        id: rightScreen
        Layout.row: 0
        Layout.column: 4
        Layout.rowSpan: 10
        Layout.columnSpan: 8
        Layout.preferredWidth: 8
        Layout.preferredHeight: 10
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    BottomBar {
        id: bottomBar
        Layout.row: 10
        Layout.column: 0
        Layout.rowSpan: 2
        Layout.columnSpan: 12
        Layout.preferredWidth: 12
        Layout.preferredHeight: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
