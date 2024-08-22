import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database
import "../DataModel.js" as DataModel

//TODO: SearchResults.qml

Rectangle {
    ColumnLayout {
        anchors.fill: parent

        Item {Layout.fillHeight: true}

        Text {
            text: "Rate My Los Rios Professor"
            Layout.alignment: Qt.AlignCenter
            Layout.bottomMargin: 20
        }

        TextField {
            id: searchField
            placeholderText: "Professor name"
            Layout.preferredWidth: parent.width / 3
            Layout.preferredHeight: 25
            Layout.alignment: Qt.AlignCenter

            Keys.onReturnPressed: {
                if (searchField.text !== "") {
                    console.log("Enter pressed with input: " + searchField.text)
                    DataModel.searchTeachers(searchField.text)
                    DataModel.setTeacherName(searchField.text)
                    searchField.text = ""
                    loader.source = "SearchResults.qml"
                }
            }
        }

        Item {Layout.fillHeight: true}
    }
}
