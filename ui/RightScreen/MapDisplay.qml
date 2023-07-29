import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle {
    id: mapDisplay
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "http://127.0.0.1/osm/" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.64, -121.61) // Tesla
        zoomLevel: 14
        activeMapType: supportedMapTypes[0]
        property geoCoordinate startCentroid

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                mapPlugin.startCentroid = mapPlugin.toCoordinate(pinch.centroid.position, false)
            }
            onScaleChanged: (delta) => {
                mapPlugin.zoomLevel += Math.log2(delta)
                mapPlugin.alignCoordinateToPoint(mapPlugin.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                mapPlugin.bearing -= delta
                mapPlugin.alignCoordinateToPoint(mapPlugin.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => mapPlugin.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: mapPlugin.zoomLevel < mapPlugin.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: mapPlugin.zoomLevel = Math.round(mapPlugin.zoomLevel + 1)
        }
        Shortcut {
            enabled: mapPlugin.zoomLevel > mapPlugin.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: mapPlugin.zoomLevel = Math.round(mapPlugin.zoomLevel - 1)
        }

    }
}
