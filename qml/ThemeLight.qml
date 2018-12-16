import QtQuick 2.0

QtObject {
    id: root
    objectName: "lightTheme"

    property color appBg: "#FAFAFA"
    property color cardBgColor: "#FFFFFF"
    property color cardTextColor: "#000000"

    Component.onCompleted: console.log("Constructed: "+root.objectName)
    Component.onDestruction: console.log("Destructed: "+root.objectName)
}
