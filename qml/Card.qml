import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    property string title: "Title"
    property string content: "Override the 'title' property to change the title info & "+
                              "'content' property to change the card description .."

    property color bgColor: "#FFFFFF"
    property color textColor: "#000000"

    Rectangle {
        id: rectId
        height: 120
        width: 200
        color: bgColor
        radius: 8
        anchors.centerIn: parent

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 15
            Label {
                id: headerId
                text: qsTr("<b>%1</b>").arg(title)
                font.pointSize: 11
                color: textColor
            }
            Text {
                id: textId
                text: qsTr("%1").arg(content)
                wrapMode: Text.WordWrap
                width: parent.width
                font.pointSize: 10
                color: textColor
            }
        }
    }

    DropShadow {
        anchors.fill: rectId
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#80000000"
        source: rectId
    }
}
