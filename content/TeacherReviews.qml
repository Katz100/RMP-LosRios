import QtQuick
import QtQuick.Layouts
import com.company.database
import QtQuick.Controls
import "../DataModel.js" as DataModel

Rectangle {
    GridLayout {
        id: grid
        anchors {fill: parent; leftMargin: 30; topMargin: 30}
        columnSpacing: 30
        columns: 4

        Item {Layout.row: 0; Layout.column: 0; Layout.fillWidth: true}
        Text {
            id: rating
            Layout.row: 0
            Layout.column: 1
            text: "<b>%1</b>/5<br>Quality Based on %2 ratings<br><b>%3</b>".arg(Database.getAverageRating(DataModel.getTeacherId()))
            .arg(Database.countTeacherRatings(DataModel.getTeacherId()))
            .arg(DataModel.getTeacherName())
        }

            Rectangle {
                Layout.preferredWidth: 400
                Layout.preferredHeight: 150
                color: "lightgray"
                Layout.column: 2
                Layout.row: 0

                GridLayout {
                    columns: 3
                    columnSpacing: 10
                    rowSpacing: 10
                    anchors.fill: parent
                    Text {
                        text: "Awesome <b>5</b>"
                    }
                    Rectangle {
                        color: "gray"
                        Layout.fillWidth: true
                        height: 20
                        Rectangle {
                            color: "blue"
                            height: parent.height
                            width: getBarLength(5) * parent.width
                        }
                    }
                    Text {
                        text: Database.getRatings(DataModel.getTeacherId(), 5)
                        Layout.rightMargin: 20
                    }

                    Text {
                        text: "Great <b>4</b>"
                    }
                    Rectangle {
                        color: "gray"
                        Layout.fillWidth: true
                        height: 20

                        Rectangle {
                            color: "blue"
                            height: parent.height
                            width: getBarLength(4) * parent.width
                        }
                    }
                    Text {
                        text: Database.getRatings(DataModel.getTeacherId(), 4)
                        Layout.rightMargin: 20
                    }

                    Text {
                        text: "Good <b>3</b>"
                    }
                    Rectangle {
                        color: "gray"
                        Layout.fillWidth: true
                        height: 20

                        Rectangle {
                            color: "blue"
                            height: parent.height
                            width: getBarLength(3) * parent.width
                        }
                    }
                    Text {
                        text: Database.getRatings(DataModel.getTeacherId(), 3)
                        Layout.rightMargin: 20
                    }

                    Text {
                        text: "OK <b>2</b>"
                    }
                    Rectangle {
                        color: "gray"
                        Layout.fillWidth: true
                        height: 20

                        Rectangle {
                            color: "blue"
                            height: parent.height
                            width: getBarLength(2) * parent.width
                        }
                    }
                    Text {
                        text: Database.getRatings(DataModel.getTeacherId(), 2)
                        Layout.rightMargin: 20
                    }

                    Text {
                        text: "Awful <b>1</b>"
                    }
                    Rectangle {
                        color: "gray"
                        Layout.fillWidth: true
                        height: 20

                        Rectangle {
                            color: "blue"
                            height: parent.height
                            width: getBarLength(1) * parent.width
                        }
                    }
                    Text {
                        text: Database.getRatings(DataModel.getTeacherId(), 1)
                        Layout.rightMargin: 20
                    }
                }
            }


            Item {Layout.row: 0; Layout.column: 3;Layout.fillWidth: true}

            ListView {
                id: lv
                model: lm
                clip: true
                Layout.row: 1
                Layout.columnSpan: 4
                Layout.rowSpan: 4
                Layout.preferredWidth: 500
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                spacing: 20
                delegate: Review {
                    width: 500
                    height: 300
                    teacherTxt: DataModel.getTeacherName()
                    courseTxt: Database.getCourse(course_id)
                    dateTxt: review_date
                    reviewTxt: review_text
                    qualityTxt: quality
                    difficultyTxt: difficulty
                }
            }

        }




        ListModel {
            id: lm
        }

        function getBarLength(rating) {
            return (Database.getRatings(DataModel.getTeacherId(), rating) / Database.countTeacherRatings(DataModel.getTeacherId()))
        }

        Component.onCompleted: {
            let reviews = Database.getTeacherReviews(DataModel.getTeacherId())
            for (let i = 0; i < reviews.length; i++) {
                lm.append(reviews[i])
            }
        }
    }
