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
            model: _teacherModel
            spacing: 20
            clip: true
            cacheBuffer: 500
            delegate:

                TeacherResult {
                width: lv.contentItem.width
                height: 150
                qualityTxt: Database.mapAverageRating(teacher_id)
                ratingsTxt: Database.mapCountTeacherRating(teacher_id) + " ratings"
                teacherTxt: name
                difficultyTxt: Database.mapAverageDifficulty(teacher_id) + " difficulty"

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
}
