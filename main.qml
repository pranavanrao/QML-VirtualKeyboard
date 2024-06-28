import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    width: 1200
    height: 800
    visible: true
    title: qsTr("Virtual Keyboard")

    Column {
        spacing: 2

        TextInput {
            id: inputField
            width: 1200
            height: 400
            font.pointSize: 20
            focus: true
            padding: 20
            color: "#000000"
        }

        VirtualKeyboard {
            width: 1200
            height: 200
            onKeyPressed: {
                inputField.text += key
            }
        }
    }
}
