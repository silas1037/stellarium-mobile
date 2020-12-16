/*
 * Stellarium
 * Copyright (C) 2013 Fabien Chereau
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335, USA.
 */

import QtQuick 2.1

Column {
	width: parent.width

	Text {
		font.pixelSize: rootStyle.fontLargeSize
		color: "white"
		anchors.horizontalCenter: parent.horizontalCenter
		text: {
			var JD_SECOND = 0.000011574074074074074074
			var factor = stellarium.timeRate / JD_SECOND;
			if (factor === 1)
				return qsTr("Real time")
			if (factor === 0)
				return qsTr("Stopped")
			return "x" + factor.toFixed(0)
		}
	}

	Row {
		anchors.horizontalCenter: parent.horizontalCenter
		ImageButton {
			source: "images/timeRewind.png"
			action: "actionDecrease_Time_Speed"
			shadow: true
		}

		ImageButton {
			source: "images/timeReal.png"
			action: "actionSet_Real_Time_Speed"
			shadow: true
		}

		ImageButton {
			source: "images/timeForward.png"
			action: "actionIncrease_Time_Speed"
			shadow: true
		}

		ImageButton {
			source: "images/timeNow.png"
			action: "actionReturn_To_Current_Time"
			shadow: true
		}
	}

	Text {
		color: "white"
		font.pixelSize: rootStyle.fontLargeSize
		anchors.horizontalCenter: parent.horizontalCenter
		text: stellarium.printableTime
	}
}
