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
    color: "lightgray"

    Text {
        id: teacherTxt
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 20
        }
    }

    Rectangle {
        id: line
        anchors {
            top: teacherTxt.bottom
            left: parent.left
            right: parent.right
            topMargin: 5
            leftMargin: 20
            rightMargin: 20
        }
        height: 2
        color: "black"
    }

    Text {
        id: quality
        text: "<b>QUALITY</b>"
        anchors {
            top: line.bottom
            left: parent.left
            leftMargin: 30
            topMargin: 20
        }
    }

    Rectangle {
        id: qualityRect
        anchors {
            top: quality.bottom
            left: parent.left
            leftMargin: 20
            topMargin: 5
        }
        width: 70
        height: 70
        color: "lightgreen"

        Text {
            id: qualityTxt
            anchors.centerIn: parent
        }
    }

    Text {
        id: difficulty
        anchors {
            top: qualityRect.bottom
            left: parent.left
            leftMargin: 25
            topMargin: 10
        }
        text: "<b>Difficulty</b>"
    }

    Rectangle {
        id: difficultyRect
        anchors {
            top: difficulty.bottom
            left: parent.left
            leftMargin: 20
            topMargin: 5
        }
        width: 70
        height: 70
        color: "gray"

        Text {
            id: difficultyTxt
            anchors.centerIn: parent
        }
    }

    Text {
        id: courseTxt
        font.bold: true
        anchors {
            left: qualityRect.right
            top: quality.bottom
            leftMargin: 30
        }
    }

    Text {
        id: dateTxt
        font.bold: true
        anchors {
            right: parent.right
            top: quality.bottom
            rightMargin: 5
        }
    }

    Text {
        id: reviewTxt
        anchors {
            top: courseTxt.bottom
            left: courseTxt.left
            topMargin: 20
        }
    }

}
