import QtQuick
import QtQuick.Controls

Rectangle {
    property alias text: txt.text
    property alias placeHolderText: tf.placeholderText
    signal nextButtonClicked(var content)
    signal backButtonClicked()

    border.color: "black"
    anchors.centerIn: parent
    width: stack.width
    height: stack.height
    Text {
        id: txt
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 20
        }
        font.bold: true
    }

    TextField {
        id: tf
        anchors.centerIn: parent
        width: parent.width / 2
    }

    Button {
        id: nextButton
        text: "Next"
        onClicked: nextButtonClicked(tf.text)
        anchors {
            bottom: parent.bottom
            right: parent.right
            rightMargin: 20
            bottomMargin: 20
        }
    }

    Button {
        id: backButton
        text: "Back"
        onClicked: backButtonClicked()
        anchors {
            bottom: parent.bottom
            left: parent.left
            leftMargin: 20
            bottomMargin: 20
        }
    }
}
