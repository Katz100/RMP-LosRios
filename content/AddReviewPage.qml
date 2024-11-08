import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle {

    property string courseName
    property string courseCode
    property string subject
    property string quality
    property string difficulty
    property string reviewText

    StackView {
        id: stack
        initialItem: courseName
        anchors.centerIn: parent
        height: Math.min(root.height, 150)
        width: Math.min(root.width / 1.3, 500)
    }

    ReviewItem {
        id: courseName
        text: "Enter Course Code"
        placeHolderText: "Course Code"

        function onNextButtonClicked(content){

        }
    }
}

