import QtQuick

Rectangle {
    id: root
    property alias teacherTxt: teacherTxt.text
    property alias courseTxt: courseTxt.text
    property alias dateTxt: dateTxt.text
    property alias reviewTxt: reviewTxt.text
    property alias qualityTxt: qualityTxt.text
    property alias difficultyTxt: difficultyTxt.text

    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width / 1.5
    height: 100
    color: "lightgray"
    Column {
    Text {
        id: teacherTxt
        anchors {
            left: parent.left
            top: parent.top
        }
    }
    Text {
        id: courseTxt
    }
    Text {
        id: dateTxt
    }
    Text {
        id: qualityTxt
    }
    Text {
        id: difficultyTxt
    }
    Text {
        id: reviewTxt
    }
    }
}
