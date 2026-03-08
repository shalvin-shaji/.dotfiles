import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Scope {
	Variants {
		model: Quickshell.screens;
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

			Row {
				anchors.left : parent.left
				anchors.verticalCenter : parent.verticalCenter

				leftPadding: 20
				Text {
					font.family: Style.font
					text: "\uef46"
					color: Style.lavender
					font.pointSize: 22
				}
				HyperWork{
					anchors.verticalCenter : parent.verticalCenter
				}
			}

			Item { Layout.fillWidth: true }

			ClockWidget { anchors.centerIn: parent }

			Item { Layout.fillWidth: true }

			Row {
				anchors.right : parent.right
				anchors.verticalCenter : parent.verticalCenter
				rightPadding: 20
				Wifi{}
				Power{}
			}

		}
	}
}
