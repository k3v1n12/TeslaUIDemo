import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation
import QtPositioning

Rectangle {
    Plugin {
        id: mapPlugin
        name: "mapboxgl"
        PluginParameter {
            name: "mapboxgl.mapping.additional_style_urls"
            value: "https://maps.tilehosting.com/styles/streets/style.json?key="
                   + hostingKey
        }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.64, -121.61) // Tesla
        zoomLevel: 14
    }
}
