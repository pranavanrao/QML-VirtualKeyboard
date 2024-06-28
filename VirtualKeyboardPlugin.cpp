#include "VirtualKeyboardPlugin.h"
#include <QFile>
#include <QJsonDocument>
#include <QDebug>

VirtualKeyboardPlugin::VirtualKeyboardPlugin(QObject *parent) : QObject(parent)
{
    loadKeyboardData("english");  // Load the default language on initialization
}

QJsonArray VirtualKeyboardPlugin::row1() const
{
    return m_row1;
}

QJsonArray VirtualKeyboardPlugin::row2() const
{
    return m_row2;
}

QJsonArray VirtualKeyboardPlugin::row3() const
{
    return m_row3;
}

QJsonArray VirtualKeyboardPlugin::row4() const
{
    return m_row4;
}

QJsonArray VirtualKeyboardPlugin::row5() const
{
    return m_row5;
}

QJsonArray VirtualKeyboardPlugin::row6() const
{
    return m_row6;
}

void VirtualKeyboardPlugin::loadKeyboardData(const QString &lang)
{
    QString filePath = QString(":/keyboard_data_%1.json").arg(lang);

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << filePath;
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    parseKeyboardData(data);
}

void VirtualKeyboardPlugin::parseKeyboardData(const QByteArray &data)
{
    QJsonDocument doc = QJsonDocument::fromJson(data);
    QJsonObject jsonObj = doc.object();

    m_row1 = jsonObj["row1"].toArray();
    m_row2 = jsonObj["row2"].toArray();
    m_row3 = jsonObj["row3"].toArray();
    m_row4 = jsonObj["row4"].toArray();
    m_row5 = jsonObj["row5"].toArray();
    m_row6 = jsonObj["row6"].toArray();

    emit dataChanged();
}
