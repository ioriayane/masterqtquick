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
      title: "&File"
      MenuItem { text: "&Exit"; onTriggered: Qt.quit() }
    }
    Menu {
      title: "&Help"
      MenuItem {
        text: "&About..."
        onTriggered: about.show()   //ダイアログ表示 [1]
      }
    }
  }
  //アバウトダイアログ      [2]
  AboutDialog {
    id: about
    color: root.color             //背景色は親のウインドウ色に合わせる    [3]
  }
}
