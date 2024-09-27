import QtQuick
import QtQuick.Controls

Popup {
    height: 150
    contentItem: ScrollView {
        id: sv
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        ListView {
            id: lv
            clip: true
            model: suggestionModel
            delegate: Text {
                text: name
            }
        }
    }
}
