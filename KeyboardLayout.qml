import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    ColumnLayout {
        spacing: 2

        RowLayout {
            Button{
                text: "-"
            }

            Button{
                text: "."
            }

            Button {
                text: ","
            }

            Button{
                text: ":"
            }

            Button{
                text: "&"
            }

            Button{
                text: "%"
            }

            Button{
                text: "'"
            }

            Button{
                text: ""
            }
        }
    }
}
