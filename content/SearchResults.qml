import QtQuick

Rectangle {

    ListView {
        anchors.fill: parent
        id: lv
        model: teacherModel
        delegate: Text {
            text: name
        }
    }
}
