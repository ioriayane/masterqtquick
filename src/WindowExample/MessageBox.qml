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
  //表示するメッセージへのエイリアス            [2]
  property alias message: msg.text
  //ボタンクリック時のシグナル                [3]
  signal accepted()   //了承
  signal canceled()   //キャンセル

  //メッセージとボタンを縦に並べる
  Column {
    id: content
    anchors.centerIn: parent
    spacing: 15
    //メッセージ                        [4]
    Text {
      id: msg
    }
    //ボタンを横に並べる
    Row {
      anchors.horizontalCenter: parent.horizontalCenter
      Button {
        text: "Yes"
        onClicked: {
          accepted()    //了承のシグナルを送信    [5]
          close()       //非表示にする          [6]
//          root.visible = false            //非表示にする
//          root.visibility = Window.Hidden //非表示にする
        }
      }
      Button {
        text: "Cancel"
        onClicked: {
          canceled()    //キャンセルのシグナル送信  [7]
          close()       //非表示にする          [8]
//          root.visible = false            //非表示にする
//          root.visibility = Window.Hidden //非表示にする
        }
      }
    }
  }
}
