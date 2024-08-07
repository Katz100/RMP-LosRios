import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database
Rectangle {
    id: profileSettings

    property bool __readable: true
    property bool __enabled: false

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
            GridLayout {
                columns: 3
                rowSpacing: 50
                anchors {left: parent.left; top: parent.top; right: parent.right; topMargin: 50; leftMargin: 50}
                Text {
                    id: usernameTxt
                    text: "Username"
                }
                TextField {
                    readOnly: __readable
                    text: Database.username
                }
                Text {
                    text: "<b>Edit</b>"

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            __readable = !__readable
                            __enabled = !__enabled
                        }
                    }
                }
                Text { text: "School" }
                ComboBox {
                    id: schoolComboBox
                    model: ["FLC", "ARC", "SCC", "CRC"]
                    enabled: __enabled
                    currentIndex: Database.getSchoolId() - 1
                    Layout.columnSpan: 2
                }

                Button {
                    id: saveChangesButton
                    Layout.columnSpan: 3
                    Layout.alignment: Qt.AlignCenter
                    text: "Save Changes"
                    visible: __enabled

                    onClicked: {
                        __enabled = false
                        __readable = true
                        //TODO: implement methods
                        Database.changeUsername(usernameTxt.text)
                        Database.setSchool(schoolComboBox.currentIndex)
                    }
                }

                Button {
                    id: cancelChangesButton
                    Layout.columnSpan: 3
                    Layout.alignment: Qt.AlignCenter
                    text: "Cancel"
                    visible: __enabled

                    onClicked: {
                        __enabled = false
                        __readable = true
                    }
                }

            }
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