
import QtQuick
import Quickshell
import Quickshell.Io

// Use Item as the root so it fits perfectly into your Bar's RowLayout
Item {
    id: soundRoot

    // Define the size so RowLayout knows how much space to give it
    implicitWidth: 40
    implicitHeight: 30

    // 1. The Command Logic
    Process {
        id: soundToggle
	running: false
        command: ['env', 'GTK_THEME=Adwaita:dark', 'pavucontrol']
        onRunningChanged: {
            if(!running) {
                mouseArea.processActive = false
            }
        }
    }

    // 2. The Visual Button
    Rectangle {
        id: trayBackground
        anchors.fill: parent
        
        // Safety check for Style singleton
        color: typeof Style !== "undefined" ? Style.flamingo : "#f2cdcd"
        radius: height / 2

        Text {
            id: icon
            anchors.centerIn: parent
            text: "\ue638" // Your notification icon
            
            color: typeof Style !== "undefined" ? Style.text : "#1e1e2e"
            font.family: typeof Style !== "undefined" ? Style.font : "sans-serif"
            font.bold: true
            font.pixelSize: 18
        }

        // 3. Interaction
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            property bool processActive: false

            // Optional: Subtle hover effect
            onEntered: trayBackground.opacity = 0.8
            onExited: trayBackground.opacity = 1.0

            onClicked: {
                if(processActive) {
                    soundToggle.running = false
                } else {
                    processActive = true
                    soundToggle.running = true
                }
            }
        }
    }
}
