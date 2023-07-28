import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle {
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "http://127.0.0.1/osm/" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    Map {
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.64, -121.61) // Tesla
        zoomLevel: 14
        activeMapType: supportedMapTypes[1]
    }
}
