import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle {
    ScrollView {
        ColumnLayout {
            anchors.fill: parent
            Rectangle {
                border.color: "black"
                height: 150
                width: Math.min(root.width / 1.3, 500)
                Layout.alignment: Qt.AlignCenter

                Text {
                    id: courseTxt
                    anchors {
                        left: parent.left
                        top: parent.top
                        leftMargin: 20
                        topMargin: 20
                    }
                    text: "<b>Enter Course Code</b>"
                }

                TextField {
                    placeholderText: "Course Code"
                    anchors.centerIn: parent
                    width: parent.width / 2
                }
            }
        }
    }
}
