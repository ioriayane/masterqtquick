import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
  visible: true
  width: 320
  height: 200
  title: qsTr("Button Example")

  //ボタンなどを縦に並べる
  Column {
    anchors.centerIn: parent
    spacing: 5

    //テスト用の文字列を表示
    Text {
      id: message
      text: "Button Example"
    }

    //通常のボタン [1]
    Button {
      //ボタンの文字列
      text: "Click!"
      //クリックしたらテキストの表示を変更
      onClicked: message.text = "Bring our zvezda's light to world far and wide!"
    }

    //メニューで複数の機能を選択できるボタン [2]
    Button {
      id: menuButton
      //非表示した子供のTextエレメントの横幅を間接的に使って自分の横幅を調節する [3]
      width: menuButtonDummy.width + 30
      //ボタンの文字列（メニューが閉じてる状態）
      text: "Society Member"
      //メニューの指定 [4]
      menu: Menu {
        //1つ目の項目
        MenuItem {
          text: "Keito"
          onTriggered: message.text = "Yes Kuno!"
        }
        //2つ目の項目
        MenuItem {
          text: "Itsuka"
          onTriggered: message.text = "Yes Ise!"
        }
        //3つ目の項目
        MenuItem {
          text: "Natasha"
          onTriggered: message.text = "Yes Hanazawa!"
        }
      }

      //Buttonの横幅を調節するためのダミーエレメント [5]
      Text {
        id: menuButtonDummy
        //横幅を測る文字列を指定
        text: parent.text
        //非表示
        visible: false
      }
    }
  }
}
