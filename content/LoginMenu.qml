import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import com.company.database

Rectangle {
    property bool txtVisible: false

    Rectangle {
        id: root
        width: parent.width / 3
        height: parent.width / 2
        anchors.centerIn: parent

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            Text {
                id: invalidTxt
                visible: txtVisible
                text: "Invalid Credentials"
                color: "red"
                Layout.alignment: Qt.AlignCenter
            }

            TextField {
                id: usernameField
                placeholderText: "username"
                maximumLength: 30

            }

            TextField {
                id: passwordField
                placeholderText: "password"
                echoMode: TextInput.Password
                maximumLength: 50
            }

            Button {
                id: signInButton
                text: "Sign in"
                Layout.preferredWidth: passwordField.width
                onClicked: {
                    if (usernameField.text === "" || passwordField.text === "" || !Database.validateLogin(usernameField.text, Database.hashPassword(passwordField.text))) {
                        txtVisible = true
                    } else {
                        Database.loginUser(usernameField.text)
                        txtVisible = false
                        usernameField.text = ""
                        passwordField.text = ""
                        loader.source = "content/HomePage.qml"
                    }

                }
            }

            Text {
                id: signUpTxt
                text: "<u>Sign up</u>"
                color: "blue"
                Layout.alignment: Qt.AlignRight

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: loader.source = "content/SignUpPage.qml"
                }
            }
        }

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 0
            verticalOffset: 1
        }

    }
}
