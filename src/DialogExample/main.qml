import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.2    //追加

ApplicationWindow {
  visible: true
  width: 320
  height: 200
  title: "Dialog Example"

  menuBar: MenuBar {
    Menu {
      title: "&File"
      MenuItem {
        text: "&Exit"
        onTriggered: confirm.open() //確認ダイアログを開く  [1]
      }
    }
  }
  //ウインドウを閉じるときのシグナル
  onClosing: {
    close.accepted = false    //ウインドウを閉じるのを拒否   [2]
    confirm.open()            //確認ダイアログを開く        [3]
  }
  //確認ダイアログ
  MessageDialog {
    id: confirm
    title: "Leave confirmation"                             //ダイアログタイトル
    text: "Do you go out of the Zvezda to leave warawa?"    //本文
    icon: StandardIcon.Information                          //アイコン
    standardButtons: StandardButton.Yes | StandardButton.No //表示するボタン [4]
    onYes: Qt.quit()                                        //アプリの終了   [5]
  }
}
