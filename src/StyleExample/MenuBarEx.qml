import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
  anchors.top: parent.top
  anchors.left: parent.left
  anchors.right: parent.right
  height: items.height
  //背景
  gradient: Gradient {
    GradientStop { position: 0   ; color: "#aaa" }
    GradientStop { position: 0.4 ; color: "#888" }
    GradientStop { position: 1   ; color: "#666" }
  }
  //メニュー全体に設定するスタイル [1]
  property var menuStyle: undefined

  //エレメント読み込み後の処理 [2]
  Component.onCompleted: {
    //子供のMenuを探して追加
    for(var i=0;i<resources.length;i++){
      if(resources[i].title !== undefined){
        //項目を追加
        repModel.append({"text": resources[i].title, "menu": resources[i]})
        //スタイルを設定
        if(menuStyle !== undefined){
          resources[i].style = menuStyle
        }
      }
    }
  }

  //項目を横方向に並べる
  Row {
    id: items
    Repeater {
      //空のリストモデルを指定して起動後にメニューの内容を登録 [3]
      model: ListModel {id: repModel}
      //各項目のレイアウト
      delegate: Rectangle {
        width: text.contentWidth * 1.2
        height: text.contentHeight * 2
        //枠線
        border.width: mouse.containsMouse ? 1 : 0
        border.color: "#222"
        //背景色（カーソルがのったらグレー。普段は透明）
        gradient: Gradient {
          GradientStop { position: 0   ; color: mouse.containsMouse ? "#ddd" : "#00000000" }
          GradientStop { position: 0.4 ; color: mouse.containsMouse ? "#ddd" : "#00000000" }
          GradientStop { position: 1   ; color: mouse.containsMouse ? "#aaa" : "#00000000" }
        }
        //マウス操作
        MouseArea {
          id: mouse
          anchors.fill: parent
          acceptedButtons: Qt.LeftButton
          hoverEnabled: true
          onClicked:{
            if(model.menu.enabled){
              model.menu.popup()          //クリックしたらポップアップ  [4]
            }
          }
        }
        //項目の文字列
        Text {
          id: text
          anchors.centerIn: parent
          text: model.text                //文字列を指定
          color: "white"
          states: [ State {
              when: !model.menu.enabled   //無効になったらグレー
              PropertyChanges { target: text; color: "darkgray" }
            }, State {
              when: mouse.containsMouse   //カーソルがのったら黒
              PropertyChanges { target: text; color: "black" }
            }
          ]
        }
      }
    }
  }
}
