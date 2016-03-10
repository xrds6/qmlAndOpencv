

import QtQuick 2.3
import QtQuick.Window 2.2


import QtMultimedia 5.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.2

import QtQuick 2.5
import QtMultimedia 5.5
import com.calibration.opencv 1.0

Window {
    visible: true

    //Width and height stuff is for desktop only, they seem to be ignored on Android (this is expected good behavior)
    width: camera.size.width
    height: camera.size.height
    maximumHeight: camera.size.height
    maximumWidth: camera.size.width

    CVCamera {
        id: camera
        device: deviceBox.currentIndex
        size: "640x480"
    }

    VideoOutput {
        anchors.top: imageSizeField.top
        id: output
        source: camera
        //orientation: 270
    }

    TextField {
        id: imageSizeField
        text: "640x480"
        placeholderText: "Enter image size"
    }

    Button {
        id: imageSizeSetButton
        text: "Set"
        anchors.left: imageSizeField.right
        onClicked: camera.size = imageSizeField.text
    }

    ComboBox {
        id: deviceBox
        width: 200
        anchors.left: imageSizeSetButton.right
        model: camera.deviceList
    }
}
