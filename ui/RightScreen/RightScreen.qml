import QtQuick 2.15

Rectangle {

    MapDisplay {
        anchors.fill: parent
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 10
        }
        width: parent.width / 40
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLocked? "../assets/locked.png" : "../assets/unlocked.png")
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
        }
    }

    Text {
        id: dateTimeDisplay
        anchors {
            left: lockIcon.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }
        font.pixelSize: 12
        font.bold: true
        color: "black"

        text: systemHandler.currentTime
    }

    Text {
        id: outdoorTempDisplay
        anchors {
            left: dateTimeDisplay.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }
        font.pixelSize: 12
        font.bold: true
        color: "black"

        text: systemHandler.outdoorTemp + "°C"
    }

    Image {
        id: userIcon
        anchors {
            left: outdoorTempDisplay.right
            bottom: lockIcon.bottom
            leftMargin: 40
        }
        width: parent.width / 39
        fillMode: Image.PreserveAspectFit
        source: "../assets/person.png"
    }

    Text {
        id: usernameDisplay
        anchors {
            left: userIcon.right
            leftMargin: 10
            bottom: lockIcon.bottom
        }
        font.pixelSize: 14
        font.bold: true
        color: "black"

        text: systemHandler.userName
    }

    NavigationSearchBox {
        id: navSearchBox

        height: parent.width / 15

        anchors {
            left: lockIcon.left
            right: usernameDisplay.right
            top: lockIcon.bottom
            topMargin: 10
        }
    }
}
