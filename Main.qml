import QtQuick
import QtQuick.Controls
import QtCore
import "content"
import com.company.database
import "DataModel.js" as DataModel
Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Rate My Los Rios Professor")

    signal menuItemClicked(var index)
    property int menuIndex: 0
    property string teacherName: ""
    property int teacherId: 0

    Settings {
        id: settings
        property string username: ""
        property string password: ""
        property int checkValue: Qt.Unchecked
    }

    Pane {
        anchors.fill: parent
        focusPolicy: Qt.ClickFocus
    }

    ListModel {
        id: teacherModel
    }

    ListModel {
        id: suggestionModel
    }

    TopBar {
        id: topBar
    }

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        running: loader.status == Loader.Loading
    }

    Loader {
        id: loader
        anchors {
            top: topBar.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }
        //source: "content/LoginMenu.qml"
        source: "content/AddReviewPage.qml"
        asynchronous: true
        visible: status == Loader.Ready
    }
}
