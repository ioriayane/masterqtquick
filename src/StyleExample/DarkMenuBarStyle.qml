import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

MenuBarStyle {
  //メニュー全体の背景
  background: Rectangle {
    //枠線
//    border.width: 1
//    border.color: "#444"
    //グラデーションで塗りつぶし
//    gradient: Gradient {
//      GradientStop { position: 0   ; color: "#aaa" }
//      GradientStop { position: 0.4 ; color: "#888" }
//      GradientStop { position: 1   ; color: "#666" }
//    }
    color: "black"
  }

  //項目の背景
//  itemDelegate: Rectangle {
////    width: text.contentWidth
////    height: text.contentHeight
////    //枠線
////    border.width: styleData.selected ? 1 : 0
////    border.color: "#222"
//    //背景色（カーソルがのったらグレー。普段は透明）
////    gradient: Gradient {
////      GradientStop { position: 0   ; color: styleData.selected ? "#ddd" : "#00000000" }
////      GradientStop { position: 0.4 ; color: styleData.selected ? "#ddd" : "#00000000" }
////      GradientStop { position: 1   ; color: styleData.selected ? "#aaa" : "#00000000" }
////    }
//    color: "#00000000"
//    Text {
//      id: text
//      text: styleData.text + "a"                          //文字列を指定
//      color: styleData.selected ? "black" : "white" //カーソルがのったら黒
      Component.onCompleted: console.debug(text.text)
//    }
//  }
}
