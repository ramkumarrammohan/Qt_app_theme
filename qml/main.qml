import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 620
    height: 480
    title: qsTr("App Theme")
    color: Theme.appBg

    Card {
        id: cardId
        bgColor: Theme.cardBgColor
        textColor: Theme.cardTextColor
        anchors.centerIn: parent
    }

    RadioButton {
        id: radioBtnId
        text: qsTr("Dark mode")
        anchors {
            top: cardId.bottom
            topMargin: 100
            horizontalCenter: parent.horizontalCenter
        }
        onCheckedChanged: {
            backend.changeTheme(!checked)
        }
    }

    Text {
        id: infoTextId
        text: qsTr("Help: Please check the dark mode checkbox to enable the dark mode")
        font.pointSize: 9
        anchors {
            bottom: parent.bottom
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }
}
