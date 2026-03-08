import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts


Row {
	leftPadding: 20
	Repeater {
		model: Hyprland.workspaces.values;
		Rectangle {
			required property var modelData
			width: 30
			height: 20
			color: modelData.active ? Style.flamingo: Style.rosewater
			radius: height/ 2
			Text {
				anchors.centerIn: parent
				text: modelData.name ? modelData.name: modelData.id
				font.pointSize: 10
				color: modelData.active ? "white": "black"
			}
			MouseArea {
				anchors.fill : parent
				cursorShape: Qt.PointingHandCursor
				onClicked: {
					Hyprland.dispatch("workspace " + modelData.id)
				}
			}
		}
	}
}
