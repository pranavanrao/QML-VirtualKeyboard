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
            color: "#FF00FF"

            Keys.onReturnPressed: {
                inputField.text += "\n"
            }
        }

        VirtualKeyboard {
            width: 1200
            height: 200
            onKeyPressed: {
                if (key === "Space") {
                    inputField.text += " "
                } else if (key === "Enter") {
                    inputField.text += "\n"
                } else if (key === "<-") {
                    inputField.text = inputField.text.substring(0, inputField.text.length - 1)
                } else {
                    inputField.text += key
                }
            }
        }
    }
}
