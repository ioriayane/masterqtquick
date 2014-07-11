import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
  id: root
  visible: true
  width: 640
  height: 480
  title: "Window Example"

  menuBar: MenuBar {
    Menu {
      title: qsTr("File")
      MenuItem {
        text: qsTr("Exit")
        onTriggered: {
          confirm1.show()
        }
      }
    }
  }

  //アプリケーションの終了確認ダイアログ
  MessageBox {
    id: confirm1
    //背景色は親のウインドウ色に合わせる
    color: root.color
    //タイトルを表示メッセージ
    title: "Attention!"
    message: "Do you go out of the society to leave warawa?"
    //OKが押されたら再確認ダイアログを表示する
    onAccepted: confirm2.show()
  }

  //終了を再確認するダイアログ
  MessageBox {
    id: confirm2
    //背景色は親のウインドウ色に合わせる
    color: root.color
    //タイトルを表示メッセージ
    title: "Attention!"
    message: "Really?"
    //OKが押されたら閉じる
    onAccepted: Qt.quit()
  }

}
