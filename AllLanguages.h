#ifndef ALLLANGUAGES_H
#define ALLLANGUAGES_H

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>

class AllLanguages : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QJsonArray column READ column NOTIFY columnChanged FINAL)

public:
    explicit AllLanguages(QObject *parent = nullptr);

    QJsonArray column() const;

    Q_INVOKABLE void loadLanguageData(const QString &lang);

signals:
    void columnChanged();

private:
    void parseLanguageData(const QByteArray &data);

    QJsonArray m_column;
};

#endif // ALLLANGUAGES_H
