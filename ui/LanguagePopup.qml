import QtQuick 2.12
import QtQuick.Controls 2.15

Popup {
    id: langPopup
    width: 200
    height: 200
    modal: true
    focus: true

    Column {
        spacing: 10
        padding: 10
        anchors.centerIn: parent

        Repeater {
            model: languagePlugin.column

            delegate: Button {
                text: modelData.toString()
                onClicked: {
                    console.log(modelData)
                    keyboard.changeLanguage(modelData.toLowerCase());
                    langPopup.close();
                }
            }
        }
    }
}
