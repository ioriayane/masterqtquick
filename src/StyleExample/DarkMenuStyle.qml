import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

MenuStyle {
  //メニュー全体の背景 [1]
  frame: Rectangle {
    //枠線
    border.width: 1
    border.color: "#444"
    //グラデーションで塗りつぶし
    gradient: Gradient {
      GradientStop { position: 0   ; color: "#aaa" }
      GradientStop { position: 0.4 ; color: "#888" }
      GradientStop { position: 1   ; color: "#666" }
    }
  }

  //区切り [2]
  separator: Item {
    Rectangle {
      anchors.centerIn: parent
      width: parent.width * 0.9
      height: 1
      color: "lightgray"
    }
  }

  //項目の背景 [3]
  itemDelegate.background: Rectangle {
    //枠線（カーソルがのったら表示する）
    border.width: styleData.selected ? 1 : 0
    border.color: "#222"
    //背景色（カーソルがのったらグレー。普段は透明）
    gradient: Gradient {
      GradientStop { position: 0   ; color: styleData.selected ? "#ddd" : "#00000000" }
      GradientStop { position: 0.4 ; color: styleData.selected ? "#ddd" : "#00000000" }
      GradientStop { position: 1   ; color: styleData.selected ? "#aaa" : "#00000000" }
    }
    //アイコン [4]
    Image {
      width: height
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      anchors.margins: 2
      fillMode: Image.PreserveAspectFit
      source: styleData.iconSource ? styleData.iconSource : ""
    }
    //サブメニューのガイド  [5]
    Image {
      anchors.right: parent.right
      anchors.rightMargin: 5
      anchors.verticalCenter: parent.verticalCenter
      visible: styleData.type === MenuItemType.Menu
      source: styleData.selected ? "sub_sel.png" : "sub_nor.png"
    }
  }

  //項目の文字列  [6]
  itemDelegate.label: Item {
    //文字列のサイズより少し大きく
    width: labelText.contentWidth + 5
    height: labelText.contentHeight + 5
    //項目の文字列
    Text {
      id: labelText
      anchors.centerIn: parent
      text: formatMnemonic(styleData.text, true)    //表示する文字列を指定
      color: "white"
      states: [ State {
          when: !styleData.enabled   //無効になったらグレー
          PropertyChanges { target: labelText; color: "darkgray" }
        }, State {
          when: styleData.selected   //カーソルがのったら黒
          PropertyChanges { target: labelText; color: "black" }
        }
      ]
    }
  }

  //ショートカットキーの文字列 [7]
  itemDelegate.shortcut: Text {
    id: shortcutText
    y: -parent.y + parent.parent.height / 2 - height / 2  //y座標を無理やり調節
    text: styleData.shortcut                              //ショートカットの文字列を指定
    color: "white"
    states: [ State {
        when: !styleData.enabled   //無効になったらグレー
        PropertyChanges { target: shortcutText; color: "darkgray" }
      }, State {
        when: styleData.selected   //カーソルがのったら黒
        PropertyChanges { target: shortcutText; color: "black" }
      }
    ]
  }

  //チェックマーク [8]
  itemDelegate.checkmarkIndicator: Image {
    visible: styleData.checked
    source: "check.png"
  }

  //サブメニューがあるときのガイドマーク（ダミー） [9]
  itemDelegate.submenuIndicator: Item { }
}
