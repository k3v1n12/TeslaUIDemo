import QtQuick 2.15
import QtLocation
import QtPositioning
import "D:\qtproject\TeslaUIDemo\Main.qml"

Rectangle {
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.useragent"; value: "My great Qt OSM application" }
        PluginParameter { name: "osm.mapping.host"; value: "http://osm.tile.server.address/" }
        PluginParameter { name: "osm.mapping.copyright"; value: "All mine" }
        PluginParameter { name: "osm.routing.host"; value: "http://osrm.server.address/viaroute" }
        PluginParameter { name: "osm.geocoding.host"; value: "http://geocoding.server.address" }
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "http://127.0.0.1/osm/" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.64, -121.61) // Tesla
        zoomLevel: 14
        activeMapType: supportedMapTypes[1]
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

        text: systemHandler.outdoorTemp + "°F"
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
        font.pixelSize: 12
        font.bold: true
        color: "black"

        text: systemHandler.userName
    }
}
