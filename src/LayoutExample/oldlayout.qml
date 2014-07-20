import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
  visible: true
  width: content.width + 30               //コンテンツのサイズに合わせる
  height: content.height + 30
  title: "Layout Example(old)"

  GroupBox {
    id: content
    anchors.centerIn: parent
    Row {
      anchors.centerIn: parent
      spacing: 10
      //複数並べるとき用の連番
      Text {
        anchors.verticalCenter: parent.verticalCenter
        text: "1:"
        font.pointSize: 12
      }
      Column {
        Row {
          spacing: 5
          //残り時間
          Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "05:59:59"
            font.pointSize: 16
          }
          //セパレータ
          Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "-"
            font.pointSize: 10
          }
          //終了予定時刻
          Column {
            anchors.bottom: parent.bottom
            Text { text: "08/17"; font.pointSize: 8 }
            Text { text: "16:00"; font.pointSize: 10 }
          }
        }
        //進捗
        ProgressBar {
          anchors.horizontalCenter: parent.horizontalCenter
          width: 100; height: 8
        }
      }
      Row {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 3
        Button { text: "Start" }  //開始ボタン
        Button { text: "Set" }    //設定ボタン
      }
    }
  }
}
