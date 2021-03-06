/****************************************************************************
**
** Copyright (C) 2017, 2018 Stefano Verzegnassi <stefano@ubports.com>
** Copyright (C) 2017 The Qt Company Ltd.
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
import QtQuick.Controls 2.2
import QtQuick.Controls.Suru 2.2
import QtQuick.Templates 2.2 as T

T.Dialog {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            header && header.visible ? header.implicitWidth : 0,
                            footer && footer.visible ? footer.implicitWidth : 0,
                            contentWidth > 0 ? contentWidth + leftPadding + rightPadding : 0)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             (header && header.visible ? header.implicitHeight + spacing : 0)
                              + (footer && footer.visible ? footer.implicitHeight + spacing : 0)
                              + (contentHeight > 0 ? contentHeight + topPadding + bottomPadding : 0))

    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)


    leftPadding: 16
    rightPadding: 16
    topPadding: 16
    bottomPadding: 16

    background: Rectangle {
        color: control.Suru.backgroundColor
        radius: 4
        border.width: 1
        border.color: control.Suru.neutralColor

        layer.enabled: true
        layer.effect: ElevationEffect {
            elevation: 1
        }
    }

    header: Label {
        text: control.title
        visible: control.title
        elide: Label.ElideRight
        topPadding: 24
        bottomPadding: 16
        leftPadding: 16
        rightPadding: 16

        font.pixelSize: 20
    }

    footer: DialogButtonBox {
        visible: count > 0
    }
}
