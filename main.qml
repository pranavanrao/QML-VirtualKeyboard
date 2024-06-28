import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 1200
    height: 600
    visible: true
    title: qsTr("Hello World")

    VirtualKeyboard {
        anchors.centerIn: parent
    }
}
