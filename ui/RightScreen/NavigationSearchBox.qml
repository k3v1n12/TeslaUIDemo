import QtQuick 2.15

Rectangle {
    id: navigationSearchBox
    radius: 5
    color:  "#f0f0f0"
    opacity: .5

    Image {
        id:searchIcon
        anchors {
            left: parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }
        source: "../assets/search.png"
        height: parent.height * .45
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: navigatePlaceHolderText
        visible: navigateTextInput.text === ""
        color: "#536363"
        anchors {
            left: searchIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        text: qsTr("Navigate")
    }

    TextInput {
        id: navigateTextInput
        clip: true
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            left: searchIcon.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
    }
}
