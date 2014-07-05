import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

ButtonStyle {
  //背景のスタイル
  background: Rectangle {
    //最低サイズ
    implicitWidth: 50
    implicitHeight: 25
    //枠線（フォーカスがあると太くなる）
    border.width:  control.activeFocus ? 2 : 1
    border.color: "#444"
    //角丸にする
    radius: 3
    //グラデーションで塗りつぶし
    gradient: Gradient {
      GradientStop { position: 0   ; color: control.pressed ? "#666" : "#aaa" }
      GradientStop { position: 0.4 ; color: control.pressed ? "#888" : "#888" }
      GradientStop { position: 1   ; color: control.pressed ? "#888" : "#666" }
    }
  }
  //文字列のスタイル
  label: Text {
    //ボタンの中心に表示
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    //anchorsは使用不可
    //anchors.centerIn: control
    //Buttonエレメントに指定された文字列を表示
    text: control.text
    //文字色を白色に
    color: "white"
  }
}
