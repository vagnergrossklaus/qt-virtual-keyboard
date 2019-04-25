import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.3
import QtQuick.VirtualKeyboard 2.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextField {
        width: parent.width
        placeholderText: "Integer"
        onAccepted: passwordField.focus = true
        inputMethodHints: Qt.ImhDigitsOnly
        validator: IntValidator {bottom: 0; top: 999999;}
    }

    TextField {
        width: parent.width
        placeholderText: "Decimal"
        onAccepted: passwordField.focus = true
        inputMethodHints: Qt.ImhDigitsOnly
        validator: DoubleValidator {bottom: 0; top: 999999;}
    }

    TextField {
        width: parent.width
        placeholderText: "String"
        onAccepted: passwordField.focus = true
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
