import QtQuick
import QtQuick.Layouts
import com.company.database
import "../DataModel.js" as DataModel

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
            height: 100
            color: "lightgray"
            Layout.column: 2
            Layout.row: 0
        }

        Item {Layout.row: 0; Layout.column: 3;Layout.fillWidth: true}

    }

}
