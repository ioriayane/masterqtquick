import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1                //追加

GridLayout {
  //実際には縦に広がるとカッコ悪いのでanchorsはこちらでしょう
  //anchors.left: parent.left
  //anchors.right: parent.right
  property alias indexText: index.text
  rows: 3                               //グリッドを3行構成         [2]
  columnSpacing: 5                      //列の間隔を少し
  rowSpacing: 1                         //行の間隔をほぼなし
  flow: GridLayout.TopToBottom          //グリッドの配置順を上から下へ  [3]
  //複数並べるとき用の連番
  Text {
    id: index
    Layout.rowSpan: 3                   //3行分結合状態          [3]
    Layout.alignment: Qt.AlignVCenter   //縦方向の中心に配置       [4]
    text: "1:"
    font.pointSize: 12
  }
  //残り時間
  Text {
    id: remainTime
    Layout.rowSpan: 2                   //2行分結合状態
    clip: true
    text: "05:59:59"
    font.pointSize: 16
  }
  //進捗バー
  ProgressBar {
    Layout.fillWidth: true              //横方向に他のマスに合わせていっぱいに広げる [5]
    Layout.maximumHeight: 8             //最大の高さとして8を指定      [6]
    Layout.columnSpan: 3                //3列分結合状態            [7]
    maximumValue: 100
    minimumValue: 0
    value: 90
  }
  //セパレータ
  Text {
    Layout.rowSpan: 2                       //2行分結合状態
    text: "-"
    font.pointSize: 10
  }
  //終了予定日
  Text {
    Layout.preferredHeight: implicitHeight
    text: "08/17"
    font.pointSize: 8
  }
  //終了予定時刻
  Text {
    Layout.preferredHeight: implicitHeight
    text: "16:00:00"
    font.pointSize: 8
  }
  //開始ボタン
  Button {
    Layout.fillWidth: true
    Layout.minimumWidth: 50         //最小サイズを指定（基本このサイズを維持）
    Layout.rowSpan: 3                 //3行分結合状態
    text: "Start"
  }
  //設定ボタン
  Button {
    Layout.preferredWidth: 50         //推奨サイズを指定（基本このサイズを維持）
    Layout.rowSpan: 3                 //3行分結合状態
    text: "Set"
  }
}
