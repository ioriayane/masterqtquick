import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1                //追加

ApplicationWindow {
  visible: true
  width: 300
  height: 130
  title: "Layout Example"

  GroupBox {
    id: contentGroup
    anchors.fill: parent
    anchors.margins: 10
    //グループ内のコンテンツより小さくならないように最小値を設定
    Layout.minimumWidth: 270
    Layout.minimumHeight: 100
    //TimerUnitを縦に並べる
    ColumnLayout {
      anchors.fill: parent    //TimerUnitを均等配置するために領域を親に張り付かせる
      spacing: 5
      //タイマーユニット1
      TimerUnit {
        //横幅は親に合わせる（高さは自分の都合）
        anchors.left: parent.left
        anchors.right: parent.right
        indexText: "1:"
      }
      //タイマーユニット2
      TimerUnit {
        //横幅は親に合わせる（高さは自分の都合）
        anchors.left: parent.left
        anchors.right: parent.right
        indexText: "2:"
      }
    }
  }
}
