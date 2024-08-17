import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database
Rectangle {
    ColumnLayout {
        anchors.fill: parent
        Item {Layout.fillHeight: true}
        Text {
            text: "Rate My Los Rios Professor"
            Layout.alignment: Qt.AlignCenter
        }

        TextField {
            id: searchField
            placeholderText: "Professor name"
            Layout.preferredWidth: parent.width / 3
            Layout.preferredHeight: 25
            Layout.alignment: Qt.AlignCenter
         background: Rectangle {
                radius: 20
                border.color: "black"
            }
            Keys.onReturnPressed: {
                if (searchField.text !== "") {
                    console.log("Enter pressed with input: " + searchField.text)
                    searchField.text = ""
                }
            }
        }

        Item {Layout.fillHeight: true}
    }
}
