/****************************************************************************
**
** Copyright (C) 2017, 2018 Stefano Verzegnassi <stefano@ubports.com>
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
****************************************************************************/

import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls.Suru 2.2

Item {
    property Item control

    implicitWidth: 40
    implicitHeight: 20

    Rectangle {
        width: parent.width
        height: parent.height

        radius: 4
        color: control.checked ? control.Suru.accentColor : control.Suru.neutralColor

        border.width: 1
        border.color: control.checked
                      ? Qt.darker(control.Suru.accentColor, 1.1)
                      : Qt.darker(control.Suru.neutralColor, 1.1)

        Behavior on color {
            ColorAnimation { duration: 75 }
        }

        Behavior on border.color {
            ColorAnimation { duration: 75 }
        }
    }

    Rectangle {
        width: 20
        height: 20
        radius: 4

        color: control.Suru.backgroundColor

        border.width: 1
        border.color: control.Suru.secondaryBackgroundColor

        // TODO: Use our own implementation of DropShadow
        layer.enabled: !control.down
        layer.effect: ElevationEffect {
            elevation: 1
        }

        x: Math.max(0, Math.min(parent.width - width,
                                control.visualPosition * parent.width - (width / 2)))
        y: (parent.height - height) / 2

        Behavior on x {
            enabled: !control.pressed
            NumberAnimation { duration: 100 }
        }
    }
}
