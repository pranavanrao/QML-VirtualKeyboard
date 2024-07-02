import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1

Rectangle {
    id: keyboard
    // color: "lightgrey"

    property color btnColor: "aqua"
    property string currentLang: "english"
    signal keyPressed(string key)

     property bool capsLockOn: false

    Component.onCompleted: {
        languagePlugin.loadLanguageData("English");
        keyboardPlugin.loadKeyboardData(currentLang);
    }

    function changeLanguage(lang) {
        currentLang = lang;
        keyboardPlugin.loadKeyboardData(lang);
    }

    function toggleCapsLock() {
        capsLockOn = !capsLockOn;
        console.log("Capslock is clicked. CapsLock state : " + capsLockOn)
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
                model: keyboardPlugin.row1
                delegate: Button {
                    text: modelData.text
                    onClicked: keyboard.keyPressed(modelData.text)
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
                model: keyboardPlugin.row2
                delegate: Button {
                    text: modelData.text
                    onClicked: keyboard.keyPressed(modelData.text)
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
                model: keyboardPlugin.row3
                delegate: Button {
                    text: capsLockOn ? modelData.alternativeUpperCaseKey : modelData.text
                    onClicked: keyboard.keyPressed(text)
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
                model: keyboardPlugin.row4
                delegate: Button {
                    text: capsLockOn ? modelData.alternativeUpperCaseKey : modelData.text
                    onClicked: keyboard.keyPressed(text)
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
                model: keyboardPlugin.row5
                delegate: Button {
                    text: capsLockOn ? modelData.alternativeUpperCaseKey : modelData.text
                    onClicked: {
                        if (text === "\u2190") {
                            if (inputField.text.length > 0) {
                                inputField.text = inputField.text.substring(0, inputField.text.length - 1);
                            }
                        } else {
                            keyboard.keyPressed(text);
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
                model: keyboardPlugin.row6
                delegate: Button {
                    text: modelData.text
                    onClicked: {
                        if (text === "123") {
                            console.log("123 clicked");
                        } else if(text === "\u2191") {
                            toggleCapsLock();
                        } else if (text === "Space") {
                            keyboard.keyPressed(" ");
                        } else if (text === "Enter") {
                            inputField.text += "\n";
                        } else if (text === "Lang") {
                            langPopup.open();
                        } else {
                            keyboard.keyPressed("Enter");
                        }
                    }
                }
            }
        }
    }

    LanguagePopup {
        id: langPopup
    }
}
