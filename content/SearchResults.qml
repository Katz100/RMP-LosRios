import QtQuick
import QtQuick.Controls
import com.company.database
import "../DataModel.js" as DataModel

Rectangle {
    ScrollView {
        anchors.fill: parent
        ListView {
            anchors.fill: parent
            id: lv
            model: teacherModel
            spacing: 20
            clip: true
            cacheBuffer: 500
            delegate: TeacherResult {
                width: lv.contentItem.width
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
                        if (loader.status === Loader.loaded()) {
                            DataModel.setTeacherSource(teacher_id, name)
                            loader.source = "content/TeacherReviews.qml"
                        }
                    }
                }
            }
        }
    }
}
