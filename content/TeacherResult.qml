import QtQuick
import QtQuick.Layouts

Rectangle {
    color: "lightgray"
    property alias qualityTxt: qualityTxt.text
    property alias ratingsTxt: ratingsTxt.text
    property alias teacherTxt: teacherTxt.text
    property alias difficultyTxt: difficultyTxt.text

    ColumnLayout {
        id: col
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        Item {Layout.fillHeight: true}
        Text {
            text: "<b>QUALITY</b>"
            Layout.alignment: Qt.AlignCenter
        }

        Rectangle {
            width: 70
            height: 70
            color: "lightgreen"

            Text {
                id: qualityTxt
                anchors.centerIn: parent
            }
        }

        Text {
            id: ratingsTxt
            Layout.alignment: Qt.AlignCenter
        }
        Item {Layout.fillHeight: true}
    }

    ColumnLayout {
        anchors {
            left: col.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 30
        }

        Text {
            id: teacherTxt
        }

        Text {
            id: difficultyTxt
        }
    }
}
