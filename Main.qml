import QtQuick
import QtQuick.Controls
import QtCore
import "content"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rate My Los Rios Professor")

    property int tabIndex: 0
    Settings {
        id: settings
        property string username: ""
        property string password: ""
        property int checkValue: Qt.Unchecked
    }

    TopBar {
        id: topBar
    }


    Loader {
        id: loader
        anchors {
            top: topBar.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
    }
        source: "content/LoginMenu.qml"
    }

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        visible: false
    }
}
