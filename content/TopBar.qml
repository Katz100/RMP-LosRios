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
            font.bold: true

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    console.log(Database.loggedIn)
                    if (Database.loggedIn) {
                        popUp.open()
                    }
                }
            }
        }

        Popup {
            id: popUp
            width: 150
            height: colLayout.implicitHeight + 20

            background: Rectangle {
                color: "white"
                radius: 5
                border.color: "black"
                border.width: 1
            }

            x: usernameTxt.x - usernameTxt.implicitWidth
            y: usernameTxt.y + usernameTxt.implicitHeight

            ColumnLayout {
                id: colLayout
                anchors.fill: parent

                Rectangle {
                    id: profile
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 5
                    Text {
                        id: profileTxt
                        anchors.centerIn: parent
                        text: "Profile"
                    }

                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            profile.color = "blue"
                            profileTxt.color = "white"
                        }
                        onExited: {
                            profileTxt.color = "black"
                            profile.color = "white"
                        }

                        onClicked: {
                            console.log("Profile clicked")
                            popUp.close()
                        }
                    }
                }

                Rectangle {
                    id: accountSettings
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 5
                    Text {
                        id: accTxt
                        anchors.centerIn: parent
                        text: "Account Settings"
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            accountSettings.color = "blue"
                            accTxt.color = "white"
                        }
                        onExited: {
                            accTxt.color = "black"
                            accountSettings.color = "white"
                        }

                        onClicked: {
                            console.log("Account Settings clicked")
                            popUp.close()
                        }
                    }
                }

                Rectangle {
                    id: logout
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 5
                    Text {
                        id: logoutTxt
                        anchors.centerIn: parent
                        text: "Logout"
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            logout.color = "blue"
                            logoutTxt.color = "white"
                        }
                        onExited: {
                            logoutTxt.color = "black"
                            logout.color = "white"
                        }

                        onClicked: {
                            console.log("Logout clicked")
                            Database.logout()
                            popUp.close()
                            loader.source = "content/LoginMenu.qml"
                        }
                    }
                }
            }
        }
    }
}
