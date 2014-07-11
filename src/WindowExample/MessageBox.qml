import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Window {
  //ウインドウサイズはメッセージとボタンのサイズに合わせる
  width: content.width + 20
  height: content.height + 20
  //デフォルトをモーダルに変更
//  modality: Qt.ApplicationModal
  modality: Qt.WindowModal
  //表示するメッセージへのエイリアス
  property alias message: msg.text
  //ボタンクリック時のシグナル
  signal accepted()   //了承
  signal canceled()   //キャンセル

  //メッセージとボタンを縦に並べる
  Column {
    id: content
    anchors.centerIn: parent
    spacing: 15
    //メッセージ
    Text {
      id: msg
    }
    //ボタンを横に並べる
    Row {
      anchors.horizontalCenter: parent.horizontalCenter
      Button {
        text: "OK"
        onClicked: {
          accepted()    //了承のシグナルを送信
          close()       //非表示にする
        }
      }
      Button {
        text: "Cancel"
        onClicked: {
          canceled()    //キャンセルのシグナル送信
          close()       //非表示にする
        }
      }
    }
  }
}
