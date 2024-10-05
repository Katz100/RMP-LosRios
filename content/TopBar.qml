import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import com.company.database
import "../DataModel.js" as DataModel

//TODO: Create custom component for menu items
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

        Button {
            text: "Home"
            Layout.preferredWidth: usernameRect.width
            onClicked: {
                loader.source = "content/HomePage.qml"
            }
        }

        Item {Layout.fillWidth: true}

        TextField {
            id: searchField
            placeholderText: "Professor name"
            Layout.preferredWidth: parent.width / 3
            Layout.preferredHeight: 25
            Layout.leftMargin: 10

            Keys.onReturnPressed: {
                if (searchField.text !== "") {
                    DataModel.searchTeachers(searchField.text)
                    if (loader.source !== "content/SearchResults.qml") {
                        loader.source = "content/SearchResults.qml"
                    }
                    searchField.text = ""
                }
            }

            onTextChanged: {
                if (searchField.text != "") {
                    Database.updateSuggestions(searchField.text)
                    DataModel.updateSuggestions(searchField.text)
                }
                else {
                    suggestionModel.clear()
                }

            }

            onActiveFocusChanged: {
                if (activeFocus) {
                    popupSuggestion.open()
                }
                else {
                    popupSuggestion.close()
                }
            }
        }

        PopupSuggestion {
            id: popupSuggestion
            x: searchField.x
            y: searchField.y + searchField.height
            width: searchField.width

            onItemClicked: function(name){
                searchField.clear()
                searchField.insert(0, name)
            }
        }


        Item {Layout.fillWidth: true}

        Rectangle {
            id: usernameRect
            height: usernameTxt.implicitHeight + 20
            width: usernameTxt.implicitWidth + 20
            color: "black"
            radius: 20
            Text {
                id: usernameTxt
                anchors.centerIn: parent
                text: "Hello, " + Database.username
                color: "white"
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (Database.loggedIn) {
                        popUp.open()
                    }
                }

                onEntered: usernameRect.color = "#2C2D2D"
                onExited: usernameRect.color = "black"
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

            x: usernameRect.x - usernameRect.implicitWidth - 70
            y: usernameRect.y + usernameRect.implicitHeight + 30

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
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            profile.color = "blue"
                            profileTxt.color = "white"
                        }
                        onExited: {
                            profileTxt.color = "black"
                            profile.color = "white"
                        }

                        onClicked: {
                            popUp.close()
                            loader.source = "content/ProfileSettings.qml"
                            menuItemClicked(0)
                            menuIndex = 0
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
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            accountSettings.color = "blue"
                            accTxt.color = "white"
                        }
                        onExited: {
                            accTxt.color = "black"
                            accountSettings.color = "white"
                        }

                        onClicked: {
                            popUp.close()
                            loader.source = "content/ProfileSettings.qml"
                            menuItemClicked(1)
                            menuIndex = 1
                        }
                    }
                }

                Rectangle {
                    id: ratings
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    radius: 5
                    Text {
                        id: ratingsTxt
                        anchors.centerIn: parent
                        text: "Your Ratings"
                    }
                    MouseArea {
                        hoverEnabled: true
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            ratings.color = "blue"
                            ratingsTxt.color = "white"
                        }
                        onExited: {
                            ratingsTxt.color = "black"
                            ratings.color = "white"
                        }

                        onClicked: {
                            popUp.close()
                            loader.source = "content/ProfileSettings.qml"
                            menuItemClicked(2)
                            menuIndex = 2
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
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            logout.color = "blue"
                            logoutTxt.color = "white"
                        }
                        onExited: {
                            logoutTxt.color = "black"
                            logout.color = "white"
                        }

                        onClicked: {
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
