import QtQuick
import com.company.database


Rectangle {
    ListView {
        anchors.fill: parent
        id: lv
        model: teacherModel
        spacing: 20
        clip: true
        delegate: TeacherResult {
            width: parent.width / 1.3
            height: 150
            qualityTxt: Database.getAverageRating(teacher_id)
            ratingsTxt: Database.countTeacherRatings(teacher_id) + " ratings"
            teacherTxt: name
            difficultyTxt: Database.getAverageDifficulty(teacher_id) + " difficulty"
        }
    }
}
