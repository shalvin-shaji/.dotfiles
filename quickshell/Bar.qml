import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts // Critical for the "fillWidth" items

Scope {
    Variants {
        model: Quickshell.screens
        
        PanelWindow {
            id: barlayout
            required property var modelData
            screen: modelData

            color: "transparent"
            implicitHeight: 30

            anchors {
                top: true
                right: true
                left: true
            }

            // Use RowLayout instead of Row to support the "Spring" spacers
            RowLayout {
                anchors.fill: parent
                spacing: 10

                // LEFT SECTION
                Row {
                    Layout.alignment: Qt.AlignLeft
                    leftPadding: 20
                    spacing: 5
                    Text {
                        font.family: Style.font
                        text: "\uef46"
                        color: Style.lavender
                        font.pointSize: 22
                    }
                    HyperWork {
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                // SPACER (The "Spring")
                Item { Layout.fillWidth: true }

                // CENTER SECTION
                ClockWidget { 
                    Layout.alignment: Qt.AlignCenter 
                }

                // SPACER (The "Spring")
                Item { Layout.fillWidth: true }

                // RIGHT SECTION
                Row {
                    Layout.alignment: Qt.AlignRight
                    rightPadding: 20
                    spacing: 2 // Space between Wifi, Notification, Power
                    
                    Wifi {}
                    Sound {}
                    Notification {}
                    Power {}
                }
            }
        }
    }
}
