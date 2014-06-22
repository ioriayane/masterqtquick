//使用するエレメントに合わせてプラグインをインポートする [1]
import QtQuick 2.2
import QtQuick.Controls 1.1

//メニューバー、ステータスバー、ツールバーを追加できるWindowを作成するエレメント　[2]
ApplicationWindow {
    //表示状態で作成する [3]
    visible: true
    //コンテンツ領域のサイズ [4]
    width: 640
    height: 480
    //ウインドウのタイトル
    title: qsTr("Hello World")

    //メニューバーの設定 [5]
    menuBar: MenuBar {
        //メニューのまとまり「File」を追加
        Menu {
            //まとまりの名前を指定
            title: qsTr("File")

            //メニュー項目「Exit」を追加
            MenuItem {
                //項目の名前を指定
                text: qsTr("Exit")
                //クリックされた時の動作を指定（アプリの終了）
                onTriggered: Qt.quit();
            }
        }
    }

    //文字列を配置 [6]
    Text {
        //表示する文字列を指定
        text: qsTr("Hello World")
        //親のエレメントの中心に配置
        anchors.centerIn: parent
        //親のエレメントの上側に合わせて配置
//        anchors.top: parent.top
//        anchors.horizontalCenter: parent.horizontalCenter
    }
}
