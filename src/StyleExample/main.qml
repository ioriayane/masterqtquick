import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
  visible: true
  width: 320
  height: 240
  title: qsTr("Style Example")

  //メニューバーを作成
  menuBar: MenuBar {
    //スタイルを設定
    style: MenuBarStyle {
      background: Rectangle {
        gradient: Gradient {
          GradientStop { position: 0   ; color: "#aaa" }
          GradientStop { position: 0.4 ; color: "#888" }
          GradientStop { position: 1   ; color: "#666" }
        }
      }
      itemDelegate: Item {
        width: 100//textItem.contentWidth
        height: 30//textItem.contentHeight
        Text {
          id: textItem
        text: formatMnemonic(styleData.text, true)    //文字列を指定
        color: styleData.selected ? "black" : "white" //カーソルがのったら黒
      }}

      menuStyle: DarkMenuStyle {}
    }

    //1つ目のメニュー
    Menu {
      title: "&File"
      MenuItem { text: "&Open"; shortcut: StandardKey.Open }
      MenuSeparator {}
      MenuItem { text: "&Quit"; onTriggered: Qt.quit() }
    }
    //2つ目のメニュー
    Menu {
      title: "&Status"
      //2階層目のメニュー1つ目
      Menu {
        title: "&Character"
        MenuItem { text: "&Venyera"; shortcut: "v"; iconSource: "zvezda.png" }
        MenuItem { text: "&White Falcon"; shortcut: "ctrl+w"; iconSource: "falcon.png" }
        MenuItem { text: "&Kyoshiro Jimon"; shortcut: "shift+k"; iconSource: "tokyo.png" }
      }
      //2階層目のメニュー2つ目
      Menu {
        id: contextMenu         //コンテキストメニューとしても使う
        title: "&Society"
        style: DarkMenuStyle {} //コンテキストメニューでも使用するので単体でも指定する
        //メニューをまとめるためのグループを定義
        ExclusiveGroup { id: group }
        MenuItem { text: "&Zvezda"; exclusiveGroup: group; checkable: true; checked: true }
        MenuItem { text: "&White Light"; exclusiveGroup: group; checkable: true }
        MenuItem { text: "&Tokyo Army"; exclusiveGroup: group; checkable: true }
      }
    }
  }
  //コンテキストメニューの表示
  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.RightButton
    onClicked: contextMenu.popup()
  }

  Column {
    anchors.centerIn: parent
    spacing: 5

    //テスト用の文字列を表示
    Text {
      id: message
      text: "Style Example"
    }

    //スタイル設定で見た目を変更
    Button {
      //ボタンの文字列
      text: "Click!"
      //ボタン用のスタイル設定
      style: DarkButtonStyle {}
      //クリックしたらテキストの表示を変更
      onClicked: message.text = "Bring our zvezda's light to world far and wide!"
    }
  }

}
