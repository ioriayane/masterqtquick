import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.1

Window {
  id: root
  //ウインドウサイズはメッセージとボタンのサイズに合わせる
  width: content.width + 20
  height: content.height + 20
  //デフォルトをモーダルに変更               [1]
  modality: Qt.ApplicationModal
//  modality: Qt.WindowModal
  title: "About"

  //アイコン　メッセージ
  //   ボタン      な位置関係に並べる
  Column {
    id: content
    anchors.centerIn: parent
    spacing: 15
    Row {
      spacing: 10
      //アイコンを表示
      Image {　source: "star.png" }
      //メッセージ
      Column {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Text { text: "Zvezda"; font.pointSize: 14 }
        Text { text: "in Udogawa city"; font.pointSize: 10 }
      }
    }
    //OKボタン
    Button {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "OK"
      onClicked: {
        close()       //ウインドウを閉じる          [2]
//          root.visible = false            //非表示にする
//          root.visibility = Window.Hidden //非表示にする
      }
    }
  }
}
