import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.company.database

Rectangle {
    property bool txtVisible: false
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
        }

        TextField {
            id: passwordField
            placeholderText: "password"
        }

        Button {
            id: signInButton
            text: "Sign in"
            Layout.preferredWidth: passwordField.width
            onClicked: {
                if (usernameField.text === "" || passwordField.text === "" || !Database.validateLogin(usernameField.text, passwordField.text)) {
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
                onClicked: loader.source = "content.signUpPage.qml"
            }
        }
    }
}
