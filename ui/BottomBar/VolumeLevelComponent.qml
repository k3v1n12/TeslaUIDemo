import QtQuick 2.15

Item {
    property string fontColor: "#f0eded"

    width: 104.1 * (parent.width / 1200)

    Connections {
        target: audioController
        function onVolumeLevelChanged() {
            console.log("dg")
            visibleTimer.stop()
            volumeIcon.visible = false
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }

    }

    Rectangle {
        id:decrementButton
        anchors {
            right:volumeIcon.left
            rightMargin: 10
            top:parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: decrementText
            color:fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 14
        }
        MouseArea {
            anchors.fill: parent
            onClicked: audioController.changeVolumeLevel(-1)
        }
    }

    Image {
        id: volumeIcon
        anchors {
            right: incrementButton.left
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .45
        fillMode: Image.PreserveAspectFit
        source: "../assets/halfVolume.png"
    }

    Text {
        id: volumetext
        visible: !volumeIcon.visible
        anchors.centerIn: volumeIcon
        color: fontColor
        font.pixelSize: 24
        text: audioController.volumeLevel
    }

    Rectangle {
        id: incrementButton
        anchors {
            right: parent.right
            top:parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: incrementText
            color:fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 14
        }
        MouseArea {
            anchors.fill: parent
            onClicked: audioController.changeVolumeLevel(1)
        }
    }

    states: [
        State {
            name: "Mute"
            when: audioController.volumeLevel <= 0
            PropertyChanges {
                volumeIcon.source: "../assets/muteVolume.png"
            }
        },

        State {
            name: "Low"
            when: audioController.volumeLevel <= 25
            PropertyChanges {
                volumeIcon.source: "../assets/lowVolume.png"
            }
        },

        State {
            name: "Mid"
            when: audioController.volumeLevel <= 50
            PropertyChanges {
                volumeIcon.source: "../assets/halfVolume.png"
            }
        },

        State {
            name: "Max"
            when: audioController.volumeLevel <= 100
            PropertyChanges {
                volumeIcon.source: "../assets/fullVolume.png"
            }
        }
    ]
}
