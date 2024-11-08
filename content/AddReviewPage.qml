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
        initialItem: nameItem
        anchors.centerIn: parent
        height: Math.min(root.height, 150)
        width: Math.min(root.width / 1.3, 500)
        pushEnter: null
        popEnter: null
        pushExit: null
        popExit: null
    }

    Component {
        id: nameItem
        ReviewItem {
            text: "Enter Course Name"
            placeHolderText: "Course Name"

            onNextButtonClicked: {
                console.log("clicked")
                stack.push(codeItem)
            }
        }
    }

    Component {
        id: codeItem
        ReviewItem {
            text: "Enter Course Code"
            placeHolderText: "Course Code"

            onNextButtonClicked: {
                stack.push(subjectItem)
            }

            onBackButtonClicked: stack.pop()
        }
    }

    Component {
        id: subjectItem
        ReviewItem {

            text: "Enter Course Subject"
            placeHolderText: "Course Subject"

            onNextButtonClicked: {
                stack.push(qualityItem)
            }
            onBackButtonClicked: stack.pop()
        }
    }
    Component {
        id: qualityItem
        ReviewItem {

            text: "Enter Course Quality"
            placeHolderText: "Course Quality"

            onNextButtonClicked: {
                stack.push(difficultyItem)
            }
            onBackButtonClicked: stack.pop()
        }
    }
    Component {
        id: difficultyItem
        ReviewItem {

            text: "Enter Course Difficulty"
            placeHolderText: "Course Difficulty"

            onNextButtonClicked: {
                stack.push(reviewItem)
            }
            onBackButtonClicked: stack.pop()
        }
    }
    Component {
        id: reviewItem
        ReviewItem {
            text: "Enter Course Review"
            placeHolderText: "Your Review"
            onBackButtonClicked: stack.pop()
        }
    }
    Component.onCompleted: {
        courseName = ""
        courseCode = ""
        subject = ""
        quality = ""
        difficulty = ""
        reviewText = ""
    }
}

