import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
        color: "#000000"

        Image {
            id: carIcon
            height: parent.height  * .75
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "../assets/caricon.png"
            anchors.leftMargin: 30
            fillMode: Image.PreserveAspectFit
        }

        HVACComponent {
            id: passengerHVACControl
            anchors {
                left: carIcon.right
                leftMargin: 120
                top:parent.top
                bottom:parent.bottom
            }
            hvacController: passengerHVAC
        }
        HVACComponent {
            id: driverHVACControl
            anchors {
                right: parent.right
                rightMargin: 120
                top:parent.top
                bottom:parent.bottom
            }
            hvacController: driverHVAC
        }
}
