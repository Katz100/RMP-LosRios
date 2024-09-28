import QtQuick
import QtQuick.Controls

Popup {
    id: root
    height: 150

    signal itemClicked(var name)

    background: Rectangle {
        border.color: "#444"
    }

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
            delegate: Rectangle {
                //width: lv.contentItem.width
                implicitHeight: nameTxt.implicitHeight
                anchors {
                    left: lv.contentItem.left
                    right: lv.contentItem.right
                    leftMargin: 2
                    rightMargin: 2
                }

                color: mouseArea.containsMouse ? "lightgray" : "white"
                Text {
                    id: nameTxt
                    text: name
                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {
                        itemClicked(nameTxt.text)
                    }
                }
            }
        }
    }
}
