import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: main_win
    width: 640
    height: 480
    visible: true
    minimumWidth: 500
    minimumHeight: 400
    title: qsTr("Image")

    readonly property int def_margin: 10
    readonly property int available_width: toolbar.width - 40

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            Action { text: qsTr("&Open...") }
            Action { text: qsTr("&Save") }
            Action { text: qsTr("Save &As...") }
            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu {
            title: qsTr("&Settings")
        }
    }

    RowLayout {
        id: row_layout
        anchors.fill: parent
        Item {
            id: image
            Layout.alignment: Qt.AlignLeft
            implicitWidth: main_win.width * 0.65
            implicitHeight: main_win.height
        }
        Rectangle {
            id: toolbar
            Layout.alignment: Qt.AlignRight
            implicitWidth: main_win.width - image.width
            implicitHeight: main_win.height
            color: "transparent"
            border.color: "black"
            border.width: 2

            ColumnLayout {
                id: toolbar_column
                anchors.fill: parent
                spacing: def_margin
                anchors.margins: def_margin

                RowLayout {
                    id: rgba_rec
                    implicitHeight: 0.4 * toolbar_column.height
                    spacing: def_margin
                    anchors.margins: def_margin
                    Rectangle {
                        Layout.alignment: Qt.AlignLeft
                        implicitWidth: 0.7 * available_width
                        implicitHeight: rgba_rec.height
                        gradient: Gradient {
                                 GradientStop { position: 0.0; color: "lightsteelblue" }
                                 GradientStop { position: 1.0; color: "blue" }
                            }
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter
                        implicitWidth: 0.15 * available_width
                        implicitHeight: rgba_rec.height
                        gradient: Gradient {
                                 GradientStop { position: 0.0; color: "black" }
                                 GradientStop { position: 1.0; color: "white" }
                            }
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignRight
                        implicitWidth: 0.15 * available_width
                        implicitHeight: rgba_rec.height
                        gradient: Gradient {
                                 GradientStop { position: 0.0; color: "white" }
                                 GradientStop { position: 1.0; color: "black" }
                            }
                    }
                }
                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
