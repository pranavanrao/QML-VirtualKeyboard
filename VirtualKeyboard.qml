import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1

Rectangle {
    id: keyboard
    // color: "lightgrey"

    property color btnColor: "aqua"
    signal keyPressed(string key)
    property bool capsLock: false

    function refreshText() {
        buttonRepeater1.update();
        buttonRepeater2.update();
        buttonRepeater3.update();
        buttonRepeater4.update();
        buttonRepeater5.update();
        buttonRepeater6.update();
    }

    Component.onCompleted: {
        loadKeyboardData();
    }

    function loadKeyboardData() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = xhr.responseText;
                    var jsonData = JSON.parse(response);
                    buttonRepeater1.model = jsonData.row1;
                    buttonRepeater2.model = jsonData.row2;
                    buttonRepeater3.model = jsonData.row3;
                    buttonRepeater4.model = jsonData.row4;
                    buttonRepeater5.model = jsonData.row5;
                    buttonRepeater6.model = jsonData.row6;
                } else {
                    console.error("Failed to load keyboard data:", xhr.statusText);
                }
            }
        }
        // Load the JSON file from the qrc path
        xhr.open("GET", "qrc:/keyboard_data.json");
        xhr.send();
    }

    ColumnLayout {
        spacing: 2
        width: parent.width

        RowLayout {
            id: row1Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater1
                delegate: Button {
                    text: modelData
                    onClicked: keyboard.keyPressed(modelData)
                }
            }
        }

        RowLayout {
            id: row2Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater2
                delegate: Button {
                    text: modelData
                    onClicked: keyboard.keyPressed(modelData)
                }
            }
        }

        RowLayout {
            id: row3Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater3
                delegate: Button {
                    text: modelData
                    onClicked: keyboard.keyPressed(modelData)
                }
            }
        }

        RowLayout {
            id: row4Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater4
                delegate: Button {
                    text: modelData
                    onClicked: keyboard.keyPressed(modelData)
                }
            }
        }

        RowLayout {
            id: row5Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater5
                delegate: Button {
                    text: modelData
                    onClicked: {
                        if (modelData === "\u2190") {
                            if (inputField.text.length > 0) {
                                inputField.text = inputField.text.substring(0, inputField.text.length - 1);
                            }
                        } else {
                            keyboard.keyPressed(modelData);
                        }
                    }
                }
            }
        }

        RowLayout {
            id: row6Layout
            spacing: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                id: buttonRepeater6
                delegate: Button {
                    text: modelData
                    onClicked: {
                        if (modelData === "123") {
                            console.log("123 clicked");
                        } else if (modelData === "Space") {
                            keyboard.keyPressed(" ");
                        } else if (modelData === "Enter") {
                            inputField.text += "\n";
                        } else {
                            keyboard.keyPressed("Enter");
                        }
                    }
                }
            }
        }
    }
}
