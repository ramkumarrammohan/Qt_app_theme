import QtQuick 2.0

QtObject {
    id: root
    objectName: "darkTheme"

    property color appBg: "#FAFAFA"
    property color cardBgColor: "#424242"
    property color cardTextColor: "#FFFFFF"

    Component.onCompleted: console.log("Constructed: "+root.objectName)
    Component.onDestruction: console.log("Destructed: "+root.objectName)
}
