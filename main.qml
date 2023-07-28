import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.5
import TeslaUIDemo
import QtQuick.Layouts
import "ui/BottomBar"
import "ui/LeftScreen"
import "ui/RightScreen"

Window {
    width: 1200
    height: 700
    visible: true
    title: qsTr("Tesla UI")


    GridLayout {
        id: mainRectangle
        anchors.fill: parent
        columns: 12
        rows: 10
        columnSpacing: 0
        rowSpacing: 0
        width: parent.width
        height: parent.height


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
}
