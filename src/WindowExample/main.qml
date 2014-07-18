import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
  id: root
  visible: true
  width: 320;  height: 240
  title: "Window Example"
  //メニュー
  menuBar: MenuBar {
    Menu {
      title: qsTr("File")
      MenuItem {
        text: qsTr("Exit")
        onTriggered: {
          confirm1.show() //1つ目のダイアログを表示する  [1]
        }
      }
    }
  }
  //アプリケーションの終了確認ダイアログ      [2]
  MessageBox {
    id: confirm1
    //背景色は親のウインドウ色に合わせる    [3]
    color: root.color
    //タイトルを表示メッセージ
    title: "Attention!"
    message: "Do you go out of the society to leave warawa?"
    //OKが押されたら再確認ダイアログを表示する [4]
    onAccepted: confirm2.show()
  }
  //終了を再確認するダイアログ           [5]
  MessageBox {
    id: confirm2
    //背景色は親のウインドウ色に合わせる   [6]
    color: root.color
    //タイトルを表示メッセージ
    title: "Attention!"
    message: "Really?"
    //OKが押されたら閉じる             [7]
    onAccepted: Qt.quit()
  }

}
