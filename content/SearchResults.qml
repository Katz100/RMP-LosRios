import QtQuick
import com.company.database

//TODO: implement getAverageRating, countTeacherRatings, getAverageDifficulty

Rectangle {
    ListView {
        anchors.fill: parent
        id: lv
        model: teacherModel
        delegate: TeacherResult {
            qualityTxt: Database.getAverageRating(teacher_id)
            ratingsTxt: Database.countTeacherRatings(teacher_id)
            teacherTxt: name
            difficultyTxt: Database.getAverageDifficulty(teacher_id)
        }
    }
}
