#include "LangModule.h"
#include <QFile>
#include <QJsonDocument>
#include <QDebug>

LangModule::LangModule(QObject *parent) : QObject(parent)
{
    loadKeyboardData("english");
}

QJsonArray LangModule::row1() const
{
    return m_row1;
}

QJsonArray LangModule::row2() const
{
    return m_row2;
}

QJsonArray LangModule::row3() const
{
    return m_row3;
}

QJsonArray LangModule::row4() const
{
    return m_row4;
}

QJsonArray LangModule::row5() const
{
    return m_row5;
}

QJsonArray LangModule::row6() const
{
    return m_row6;
}

void LangModule::loadKeyboardData(const QString &lang)
{
    QString filePath = QString(":/data/keyboard_data_%1.json").arg(lang);

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << filePath;
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    parseKeyboardData(data);
}

void LangModule::parseKeyboardData(const QByteArray &data)
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
