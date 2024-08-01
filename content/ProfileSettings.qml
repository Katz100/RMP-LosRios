import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database
Rectangle {
    id: profileSettings

    Text {
        id: userTxt
        text: "<b>Hey, " + Database.username + "</b>"
    }

    TabBar {
        id: control
        width: parent.width
        anchors.top: userTxt.bottom
        TabButton {
            text: "Profile"
            font.bold: control.currentIndex === 0

            background: Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Rectangle {
                color: "black"
                height: control.currentIndex === 0 ? 2 : 0
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }

        }
        TabButton {
            text: "Account Settings"
            font.bold: control.currentIndex === 1
            background: Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Rectangle {
                color: "black"
                height: control.currentIndex === 1 ? 2 : 0
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }
        }
        TabButton {
            text: "Your Ratings"
            font.bold: control.currentIndex === 2
            background: Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }
            Rectangle {
                color: "black"
                height: control.currentIndex === 2 ? 2 : 0
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
            }
        }
    }

    StackLayout {
        width: parent.width
        currentIndex: control.currentIndex
        anchors.top: control.bottom
        Rectangle {
            id: profileTab
            Text {text: "Profile"}
        }
        Rectangle {
            id: accountSettingsTab
            Text {text: "Account Settings"}
        }
        Rectangle {
            id: ratingsTab
            Text {text: "Ratings"}
        }
    }

   Connections {
       target: window
       function onMenuItemClicked(index) {
           control.setCurrentIndex(index)
       }
   }
}
