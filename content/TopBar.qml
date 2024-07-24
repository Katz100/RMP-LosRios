import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import com.company.database

Rectangle {
    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }
    height: 60
    color: "black"

    RowLayout {
        anchors.fill: parent
        TextField {
            id: searchField
            placeholderText: "Professor name"
            Layout.preferredWidth: parent.width / 3
            Layout.preferredHeight: 25
            Layout.leftMargin: 10
            background: Rectangle {
                radius: 20
            }
            Keys.onReturnPressed: {
                if (searchField.text !== "") {
                    console.log("Enter pressed with input: " + searchField.text)
                    searchField.text = ""
                }
            }
        }



        Text {
            id: usernameTxt
            text: "Hello, " + Database.username
            color: "white"
        }
    }
}
