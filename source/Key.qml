import QtQuick 2.0

Item {
    id: key

    property string mainLabel: "A"
    property var secondaryLabels: [];

    property var iconSource;

    property color keyColor: "#404040"
    property color keyPressedColor: "grey"
    property int keyBounds: 2

    property var mainFontFamily: "Roboto"
    property color mainFontColor: "white"
    property int mainFontSize: 36

    property var secondaryFontFamily: "Roboto"
    property color secondaryFontColor: "white"
    property int secondaryFontSize: 18

    property bool secondaryLabelVisible: true

    property bool isChekable;
    property bool isChecked;

    property bool upperCase;

    signal clicked()
    signal alternatesClicked(string symbol)

    Rectangle {
        id: backgroundItem
        anchors.fill: parent
        anchors.margins: key.keyBounds
        color: key.isChecked || mouseArea.pressed ? key.keyPressedColor : key.keyColor;
    }

    Column
    {
        anchors.centerIn: backgroundItem

        Text {
            id: secondaryLabelsItem
            smooth: true
            anchors.right: parent.right
            visible: secondaryLabelVisible
            text: secondaryLabels.length > 0 ? secondaryLabels : ""
            color: secondaryFontColor

            font.pointSize: secondaryFontSize
            font.weight: Font.Light
            font.family: secondaryFontFamily
            font.capitalization: upperCase ? Font.AllUppercase :
                                                     Font.MixedCase
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: icon
                smooth: true
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: mainLabelItem
                smooth: true
                anchors.verticalCenter: parent.verticalCenter
                text: mainLabel
                color: mainFontColor

                font.pointSize: mainFontSize
                font.weight: Font.Light
                font.family: mainFontFamily
                font.capitalization: upperCase ? Font.AllUppercase :
                                                         Font.MixedCase
            }
        }
    }

    Row {
        id: alternatesRow
        property int selectedIndex: -1
        visible: false
        anchors.bottom: backgroundItem.top
        anchors.left: backgroundItem.left

        Repeater {
            model: secondaryLabels.length

            Rectangle {
                property bool isSelected: alternatesRow.selectedIndex == index
                color: isSelected ? mainLabelItem.color : key.keyPressedColor
                height: backgroundItem.height
                width: backgroundItem.width

                Text {
                    anchors.centerIn: parent
                    text: secondaryLabels[ index ]
                    font: mainLabelItem.font
                    color: isSelected ? key.keyPressedColor : mainLabelItem.color
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressAndHold: alternatesRow.visible = true
        onClicked: {
            if (key.isChekable) key.isChecked = !key.isChecked
            key.clicked()
        }

        onReleased: {
            alternatesRow.visible = false
            if (alternatesRow.selectedIndex > -1)
                key.alternatesClicked(secondaryLabels[alternatesRow.selectedIndex])
        }

        onMouseXChanged: {
            alternatesRow.selectedIndex =
            (mouseY < 0 && mouseX > 0 && mouseY < alternatesRow.width) ?
                        Math.floor(mouseX / backgroundItem.width) :
                        -1;
        }
    }
}
