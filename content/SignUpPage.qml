import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import com.company.database
import com.company.network

Rectangle {
    property bool txtVisible: false
    property string invalidString: "Invalid Credentials"

    Rectangle {
        id: root
        width: parent.width / 2
        height: parent.width / 2
        anchors.centerIn: parent
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            Text {
                id: invalidTxt
                visible: txtVisible
                color: "red"
                text: invalidString
                Layout.alignment: Qt.AlignCenter
            }

            TextField {
                id: usernameField
                placeholderText: "username"
                maximumLength: 30
                Layout.alignment: Qt.AlignCenter
            }

            TextField {
                id: passwordField
                placeholderText: "password"
                echoMode: TextInput.Password
                maximumLength: 50
                Layout.alignment: Qt.AlignCenter
            }

            TextField {
                id: repeatPassword
                placeholderText: "repeat password"
                echoMode: TextInput.Password
                maximumLength: 50
                Layout.alignment: Qt.AlignCenter
            }

            Button {
                id: signUpButton
                text: "Sign up"
                Layout.preferredWidth: passwordField.width
                Layout.alignment: Qt.AlignCenter
                onClicked: {
                    if (usernameField.text === "" || passwordField.text === "" || (passwordField.text !== repeatPassword.text)) {
                        txtVisible = true
                        invalidString = "Invalid Credentials/Passwords do not match"
                    } else if (Database.isUsernameTaken((usernameField.text).toLowerCase())) {
                        txtVisible = true
                        invalidString = "Username Taken"
                    } else if (/\s/.test(usernameField.text) || /\s/.test(passwordField.text)) {
                        txtVisible = true
                        invalidString = "Username/Password cannot contain whitespace"
                    } else if (Network.usernameHasProfanity(usernameField.text)) {
                        txtVisible = true
                        invalidString = "Username cannot contain profanity"
                    } else {
                        //TODO: implement generateSalt(), redo registerUser()
                        let salt = Database.generateSalt()
                        Database.registerUser((usernameField.text).toLowerCase(), Database.hashPassword(passwordField.text + salt), salt)
                        Database.loginUser(usernameField.text)
                        loader.source = "content/HomePage.qml"
                    }
                }
            }

            Text {
                id: signInTxt
                text: "<u>Sign in</u>"
                color: "blue"
                Layout.alignment: Qt.AlignRight

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: loader.source = "content/LoginMenu.qml"
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
