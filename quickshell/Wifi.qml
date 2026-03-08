import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {

	id: wifi
	implicitWidth: 180
	implicitHeight: 30

	property string currentSsid: "\udb82\udd2d"
	property bool changed
	ListModel { id: savedNetworksModel }

	Process {
		id: activeWifi
		command: ['nmcli', '-t', '-f', 'ACTIVE,SSID', 'dev', 'wifi']
		running: true
		stdout: SplitParser {
				onRead: data => {
					if (data.startsWith("yes")) {
						wifi.changed = true
						wifi.currentSsid = data.substring(4)
					} 
				}
			}
		onExited: {
			if (!wifi.changed){
				wifi.currentSsid = "Disconnected"
			}
			wifi.changed = false
		}
	}
	Timer {
		interval: 2000
		running: true
		repeat: true
		onTriggered: activeWifi.running = true
	}
	Rectangle {
        id: mainButton
        height: 30
        width: wifiRow.implicitWidth + 24
        radius: 15
        // Change color based on connection status
        color: wifi.currentSsid === "Disconnected" ? "#e78284" : Style.lavender

        Row {
            id: wifiRow
            anchors.centerIn: parent
            spacing: 8
            Text { text: "Wi-Fi"; color: "white"; font.bold: true }
            Text { text: wifi.currentSsid; color: "white" }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                savedNetworksModel.clear() // Clear old list before loading new
                savedWifiProc.running = true
                wifiPopup.open()
            }
        }
    }

}
