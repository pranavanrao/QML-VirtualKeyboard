import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: keyboard
    // color: "lightgrey"

    property color btnColor: "aqua"

    signal keyPressed(string key)

    property bool capsLock: false

    function refreshText() {
        for (var i = 0; i < buttonRepeater1.count; i++) {
            var item = buttonRepeater1.itemAt(i);
            if (item) item.text = capsLock ? item.modelData.toUpperCase() : item.modelData.toLowerCase();
        }
        for (var i = 0; i < buttonRepeater2.count; i++) {
            var item = buttonRepeater2.itemAt(i);
            if (item) item.text = capsLock ? item.modelData.toUpperCase() : item.modelData.toLowerCase();
        }
        for (var i = 0; i < buttonRepeater3.count; i++) {
            var item = buttonRepeater3.itemAt(i);
            if (item) item.text = capsLock ? item.modelData.toUpperCase() : item.modelData.toLowerCase();
        }
        for (var i = 0; i < buttonRepeater4.count; i++) {
            var item = buttonRepeater4.itemAt(i);
            if (item) item.text = capsLock ? item.modelData.toUpperCase() : item.modelData.toLowerCase();
        }
    }

    ColumnLayout {
        spacing: 2
        width: parent.width

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater1
                model: ["-", ".", ",", ":", "&", "%", "'", "(", ")", "+"]

                Button {
                    text: keyboard.capsLock ? modelData.toUpperCase() : modelData.toLowerCase()
                    onClicked: keyboard.keyPressed(text)
                }
            }
        }

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater2
                model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

                Button {
                    text: modelData
                    onClicked: keyboard.keyPressed(text)
                }
            }
        }

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater3
                model: ["Q","W","E","R","T","Y","U","I","O","P"]

                Button {
                    text: keyboard.capsLock ? modelData.toUpperCase() : modelData.toLowerCase()
                    onClicked: keyboard.keyPressed(text)
                }
            }
        }

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater4
                model: ["A","S","D","F","G","H","J","K","L"]

                Button {
                    text: keyboard.capsLock ? modelData.toUpperCase() : modelData.toLowerCase()
                    onClicked: keyboard.keyPressed(text)
                }
            }
        }

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater5
                model: ["Caps","Z","X","C","V","B","N","M","<-"]

                Button {
                    text: modelData
                    onClicked: {
                        if (modelData === "Caps") {
                            keyboard.capsLock = !keyboard.capsLock
                            keyboard.refreshText()
                        } else {
                            keyboard.keyPressed(text)
                        }
                    }
                }
            }
        }

        RowLayout {
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Button {
                text: "123"
                onClicked: keyboard.keyPressed("123")
            }

            Button {
                width: 50
                text: "Space"
                onClicked: keyboard.keyPressed("Space")
            }

            Button {
                text: "Enter"
                onClicked: {
                    inputField.text += "\n"
                    keyboard.keyPressed("Enter")
                }
            }
        }
    }
}
