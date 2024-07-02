#include "AllLanguages.h"

#include <QFile>
#include <QJsonDocument>
#include <QDebug>

AllLanguages::AllLanguages(QObject *parent)
    : QObject{parent}
{}

QJsonArray AllLanguages::column() const
{
    return m_column;
}

void AllLanguages::loadLanguageData(const QString &lang)
{
    QString filePath = QString(":/languages_data.json").arg(lang);

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << filePath;
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    parseLanguageData(data);
}

void AllLanguages::parseLanguageData(const QByteArray &data)
{
    QJsonDocument doc = QJsonDocument::fromJson(data);
    QJsonObject jsonObj = doc.object();

    m_column = jsonObj["column"].toArray();

    emit columnChanged();
}
