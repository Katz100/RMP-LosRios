import QtQuick
import QtQuick.Layouts
import com.company.database
import "../DataModel.js" as DataModel

//TODO: implement Database.getRatings()
Rectangle {
    GridLayout {
        anchors {left: parent.left; top: parent.top; right: parent.right; leftMargin: 30; topMargin: 30}
        columnSpacing: 30
        columns: 4

        Item {Layout.row: 0; Layout.column: 0; Layout.fillWidth: true}
        Text {
            id: rating
            Layout.row: 0
            Layout.column: 1
            text: "<b>%1</b>/5<br>Quality Based on %2 ratings<br>%3".arg(Database.getAverageRating(DataModel.getTeacherId()))
                                                         .arg(Database.countTeacherRatings(DataModel.getTeacherId()))
                                                         .arg(DataModel.getTeacherName())
        }

        Rectangle {
            width: 400
            height: 150
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
                    color: "blue"
                    Layout.fillWidth: true
                    height: 20
                }
                Text {
                    text: Database.getRatings(DataModel.getTeacherId(), 5)
                    Layout.rightMargin: 20
                }

                Text {
                    text: "Great <b>4</b>"
                }
                Rectangle {
                    color: "blue"
                    Layout.fillWidth: true
                    height: 20
                }
                Text {
                    text: Database.getRatings(DataModel.getTeacherId(), 4)
                    Layout.rightMargin: 20
                }

                Text {
                    text: "Good <b>3</b>"
                }
                Rectangle {
                    color: "blue"
                    Layout.fillWidth: true
                    height: 20
                }
                Text {
                    text: Database.getRatings(DataModel.getTeacherId(), 3)
                    Layout.rightMargin: 20
                }

                Text {
                    text: "OK <b>2</b>"
                }
                Rectangle {
                    color: "blue"
                    Layout.fillWidth: true
                    height: 20
                }
                Text {
                    text: Database.getRatings(DataModel.getTeacherId(), 2)
                    Layout.rightMargin: 20
                }

                Text {
                    text: "Awful <b>1</b>"
                }
                Rectangle {
                    color: "blue"
                    Layout.fillWidth: true
                    height: 20
                }
                Text {
                    text: Database.getRatings(DataModel.getTeacherId(), 1)
                    Layout.rightMargin: 20
                }
            }
        }

        Item {Layout.row: 0; Layout.column: 3;Layout.fillWidth: true}

    }

}
