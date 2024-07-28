import QtQuick
import QtQuick.Controls
import "content"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rate My Los Rios Professor")

    TopBar {
        id: topBar
    }

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        visible: false
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


}
