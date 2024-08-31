import QtQuick
import com.company.database
import "../DataModel.js" as DataModel

Rectangle {
    ListView {
        anchors.fill: parent
        id: lv
        model: teacherModel
        spacing: 20
        clip: true
        delegate: TeacherResult {
            //TODO: fix TypeError
            width: parent.width / 1.3
            height: 150
            qualityTxt: Database.getAverageRating(teacher_id)
            ratingsTxt: Database.countTeacherRatings(teacher_id) + " ratings"
            teacherTxt: name
            difficultyTxt: Database.getAverageDifficulty(teacher_id) + " difficulty"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    DataModel.setTeacherSource(teacher_id, name)
                    loader.source = "content/TeacherReviews.qml"
                }
            }
        }
    }
}
