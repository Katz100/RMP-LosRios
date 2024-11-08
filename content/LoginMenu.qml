import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import com.company.database

//TODO: fix capitalization bug

Rectangle {
    property bool __txtVisible: false
    property bool __showPassword: false

    Rectangle {
        id: root
        width: parent.width / 2
        height: parent.width / 2
        anchors.centerIn: parent

        GridLayout {
            id: col
            anchors.centerIn: parent
            columns: 2
            rowSpacing: 20

            Text {
                id: invalidTxt
                visible: __txtVisible
                text: "Invalid Credentials"
                color: "red"
                Layout.alignment: Qt.AlignCenter
                Layout.columnSpan: 2
            }

            TextField {
                id: usernameField
                placeholderText: "username"
                text: settings.username
                maximumLength: 30
                Layout.columnSpan: 2
            }

            TextField {
                id: passwordField
                placeholderText: "password"
                text: settings.password
                echoMode: __showPassword ? TextInput.Normal : TextInput.Password
                maximumLength: 50
            }

            Image {
                id: viewPasswordImg
                source: !__showPassword ? "../images/icons8-eye-24.png" : "../images/icons8-hide-24.png"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: __showPassword = !__showPassword
                }
            }

            Button {
                id: signInButton
                text: "Sign in"
                Layout.preferredWidth: passwordField.width
                Layout.columnSpan: 2
                onClicked: {
                    if(!Database.isConnected()) {
                        Database.connectToDatabase()
                    }
                    if (usernameField.text === "" || passwordField.text === "" || !Database.validateLogin((usernameField.text).toLowerCase(), Database.hashPassword(passwordField.text + Database.getUserSalt(usernameField.text)))) {
                        __txtVisible = true
                    } else {
                        Database.loginUser(usernameField.text)
                        __txtVisible = false
                        if (checkBox.checkState === Qt.Checked) {
                            settings.username = usernameField.text
                            settings.password = passwordField.text
                        } else {
                            settings.username = ""
                            settings.password = ""
                        }
                        usernameField.text = ""
                        passwordField.text = ""
                        loader.source = "content/HomePage.qml"
                    }

                }
            }
        }

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 0
            verticalOffset: 1
        }
        CheckBox {
            id: checkBox
            checkState: settings.checkValue
            anchors {
                top: col.bottom
                left: col.left
                topMargin: 20
            }

            onCheckStateChanged: settings.checkValue = checkState
        }

        Text {
            id: rememberMeTxt
            text: "Remember me"
            anchors {
                top: col.bottom
                left: checkBox.right
                topMargin: 20
            }
        }

        Text {
            id: signUpTxt
            text: "<u>Sign up</u>"
            color: "blue"
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 5
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: loader.source = "content/SignUpPage.qml"
            }
        }
    }
}
