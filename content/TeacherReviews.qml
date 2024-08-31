import QtQuick
import QtQuick.Layouts
import com.company.database
import "../DataModel.js" as DataModel

Rectangle {
    GridLayout {
        anchors {left: parent.left; top: parent.top; leftMargin: 30; topMargin: 30}
        columnSpacing: 30
        columns: 2
        Text {
            id: rating
            Layout.row: 1
            text: Database.getAverageRating(DataModel.getTeacherId()) + "/5"
        }

        Text {
            id: count
            Layout.row: 2
            text: "Quality Based on " + Database.countTeacherRatings(DataModel.getTeacherId()) + " ratings"
        }

        Text {
            id: name
            Layout.row: 3
            text: DataModel.getTeacherName()
        }

    }

}
