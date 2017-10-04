import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    width: 800
    height: 600

    TextField {
        id: textInput
        width: parent.width
        height: parent.height / 5
        text: ""
        font.pixelSize: 48
        anchors.top: parent.top
        focus: true
    }

    // static linking (compiled)
    Keyboard {
        width: parent.width
        height: parent.height * 4 / 5
        anchors.bottom: parent.bottom
        source: "keyboard_one.xml"
        rows: 4
        columns: 10
        target: textInput
        onEnterClicked: console.log("Enter!")
    }

    // dynamic linking
//    Loader {
//        id: loadedkeyboard
//        width: parent.width
//        height: parent.height * 4 / 5
//        anchors.bottom: parent.bottom
//        source: "file:/ABSOLUTE_PATH/Keyboard.qml"

//        Component.onCompleted: {
//            loadedkeyboard.item.source = "keyboard_one.xml"
//            loadedkeyboard.item.rows = 4
//            loadedkeyboard.item.columns = 10
//            loadedkeyboard.item.target = textInput
//        }

//        Connections {
//            target: loadedkeyboard.item
//            onEnterClicked: console.log("Enter!")
//        }
//    }
}
