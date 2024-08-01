import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Rectangle {
    id: profileSettings

    TabBar {
        id: control
        width: parent.width
        TabButton {
            text: "Profile"
        }
        TabButton {
            text: "Account Settings"
        }
        TabButton {
            text: "Your Ratings"
        }

        onCurrentIndexChanged: console.log(currentIndex)
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
}
