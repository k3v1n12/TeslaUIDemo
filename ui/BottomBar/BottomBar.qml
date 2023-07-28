import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
        color: "#000000"

        Image {
            id: carIcon
            height: parent.height  * .80
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "../assets/caricon.png"
            anchors.leftMargin: 30
            fillMode: Image.PreserveAspectFit
        }
}
