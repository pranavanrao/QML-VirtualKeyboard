import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: keyboard
    anchors.fill: parent
    color: "lightgrey"

    signal keyPressed(string key)

    GridLayout {
        anchors.fill: parent
        columns: 10

        Repeater {
            model: ["1","2","3","4","5","6","7","8","9","0",
                    "Q","W","E","R","T","Y","U","I","O","P",
                    "A","S","D","F","G","H","J","K","L",
                    "Z","X","C","V","B","N","M",
                    "Space", "Enter"]

            Button {
                text: modelData
                onClicked: {
                    keyboard.keyPressed(modelData)
                }
            }
        }
    }

    Connections {
        target: keyboardPlugin
        onKeyPressed: {
            console.log("Key pressed in QML:", key)
        }
    }

    onKeyPressed: keyboardPlugin.handleKeyPress(key)
}
