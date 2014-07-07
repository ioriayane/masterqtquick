import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

MenuBarStyle {
  //メニュー全体の背景 [1]
  background: Rectangle {
    gradient: Gradient {
      GradientStop { position: 0   ; color: "#aaa" }
      GradientStop { position: 0.4 ; color: "#888" }
      GradientStop { position: 1   ; color: "#666" }
    }
  }
  //テキスト  [2]
  itemDelegate: Text {
    text: formatMnemonic(styleData.text, true)    //文字列を指定
    color: styleData.selected ? "black" : "white" //カーソルがのったら黒
  }
}
