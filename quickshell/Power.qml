import Quickshell
import QtQuick
import Quickshell.Services.UPower

Rectangle {
	id: powerPill
	color: Style.flamingo
	radius: height / 2



	height: 30
	width: 40

	Text {
		id: profileText
		anchors.centerIn: parent
		font.family : Style.font
		text: {
			if (PowerProfiles.profile === PowerProfile.PowerSaver)
			return "\uf06c"
			else if (PowerProfiles.profile === PowerProfile.Balanced)
			return "\uf24e"
			else
			return "\uf0e7"
		}



		color: Style.text
		font.bold: true
		font.pixelSize: 16
	}

	MouseArea {
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
		onClicked: {
			if (PowerProfiles.profile === PowerProfile.PowerSaver)
			PowerProfiles.profile = PowerProfile.Balanced
			else if (PowerProfiles.profile === PowerProfile.Balanced)
			PowerProfiles.profile = PowerProfile.Performance
			else
			PowerProfiles.profile = PowerProfile.PowerSaver
		}
	}
}
