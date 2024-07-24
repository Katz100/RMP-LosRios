import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database

Rectangle {
    property bool txtVisible: false
    property string invalidString: "Invalid Credentials"
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
        }

        TextField {
            id: passwordField
            placeholderText: "password"
            echoMode: TextInput.Password
        }

        TextField {
            id: repeatPassword
            placeholderText: "repeat password"
            echoMode: TextInput.Password
        }

        Button {
            id: signUpButton
            text: "Sign up"
            Layout.preferredWidth: passwordField.width
            onClicked: {
                if (usernameField.text === "" || passwordField.text === "" || (passwordField.text !== repeatPassword.text)) {
                    txtVisible = true
                    invalidString = "Invalid Credentials"
                } else if (Database.isUsernameTaken(usernameField.text)) {
                    txtVisible = true
                    invalidString = "Username Taken"
                } else {
                    Database.registerUser(usernameField.text, Database.hashPassword(passwordField.text))
                    Database.loginUser(usernameField.text)
                    txtVisible = false
                    usernameField.text = ""
                    passwordField.text = ""
                    repeatPassword.text = ""
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
}
