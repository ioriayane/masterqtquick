import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
  visible: true
  width: 320
  height: 200
  title: "Menu Example"

  //メニューバーを作成
  menuBar: MenuBar {
    //1つ目のメニュー
    Menu {
      title: "File"
      //ファイルを開く
      MenuItem {
        text: "Open"
        shortcut: StandardKey.Open            //ショートカットの設定  [1]
        onTriggered: message.text = "Open!!"
      }
      //区切り線
      MenuSeparator {}
      //最近選択した項目
      Menu {
        id: recentItem
        title: "Recent"
        visible: recentItem.items.length > 0  //登録されるまで非表示
        //登録された項目を選んだ時の動作を定義  [2]
        Action {
          id: recentItemAction
          onTriggered: message.text =  "recent = %1".arg(source.text)
        }
        //最近選択した項目へ登録する         [3]
        function addRecentItem(text, icon){
          var item = recentItem.addItem(text) //項目を登録           [4]
          item.action = recentItemAction      //Actionを動作として設定  [5]
          item.iconSource = icon              //アイコンの設定
        }
      }
      //区切り線
      MenuSeparator {
        visible: recentItem.visible           //最近選択した項目に連動して表示
      }
      //アプリケーションを終了
      MenuItem {
        text: "Quit"
        shortcut: StandardKey.Quit            //ショートカットの設定 [6]
        onTriggered: Qt.quit()
      }
    }
    //2つ目のメニュー
    Menu {
      title: "Status"
      //2階層目のメニュー1つ目
      Menu {
        title: "Character"
        MenuItem {
          text: "Venyera"
          shortcut: "v"             //ショートカットの設定（小文字のv）         [8]
          iconSource: "zvezda.png"  //アイコンの設定                     [9]
          onTriggered: recentItem.addRecentItem(text, iconSource)  //[10]
        }
        MenuItem {
          text: "White Falcon"
          shortcut: "ctrl+w"        //ショートカットの設定                  [11]
          iconSource: "falcon.png"  //アイコンの設定                     [12]
          onTriggered: recentItem.addRecentItem(text, iconSource) //[13]
        }
        MenuItem {
          text: "Kyoshiro Jimon"
          shortcut: "shift+k"       //ショートカットの設定                  [14]
          iconSource: "tokyo.png"   //アイコンの設定                     [15]
          onTriggered: recentItem.addRecentItem(text, iconSource) //[16]
        }
      }
      //2階層目のメニュー2つ目
      Menu {
        id: contextMenu       //コンテキストメニューとしても使う  [17]
        title: "Society"
        //メニューをまとめるためのグループを定義 [18]
        ExclusiveGroup {
          id: group
          //選択されている項目が変更された
          onCurrentChanged: message.text = "Society = %1".arg(current.text)
        }
        MenuItem {
          text: "Zvezda"            //表示する文字列
          exclusiveGroup: group     //所属するグループの指定     [19]
          checkable: true           //チェックできるように設定
          checked: true             //1つ目をデフォルト状態にする
        }
        MenuItem {
          text: "White Light"       //表示する文字列
          exclusiveGroup: group     //所属するグループの指定     [20]
          checkable: true           //チェックできるように設定
        }
        MenuItem {
          text: "Tokyo Army"        //表示する文字列
          exclusiveGroup: group     //所属するグループの指定     [21]
          checkable: true           //チェックできるように設定
        }
      }
    }
  }

  //テスト用の文字列を表示
  Text {
    id: message
    anchors.centerIn: parent
    text: "Menu Example"
  }

  //マウス入力を受け付ける [22]
  MouseArea {
    anchors.fill: parent              //ウインドウ全体
    acceptedButtons: Qt.RightButton   //右クリックのみ
    //クリック時の処理
    onClicked: {
      //メニューバーの一部をポップアップ  [23]
      contextMenu.popup()
    }
  }
}
