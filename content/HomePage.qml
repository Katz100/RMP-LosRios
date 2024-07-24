import QtQuick
import com.company.database
Rectangle {
    Text {
        anchors.centerIn: parent
        text: "Hello, " + Database.username
    }
}
