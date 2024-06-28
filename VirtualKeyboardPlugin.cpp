#include "VirtualKeyboardPlugin.h"
#include <QDebug>

VirtualKeyboardPlugin::VirtualKeyboardPlugin(QObject *parent) : QObject(parent)
{
}

void VirtualKeyboardPlugin::handleKeyPress(QString key)
{
    qDebug() << "Key pressed:" << key;
    emit keyPressed(key);
}
