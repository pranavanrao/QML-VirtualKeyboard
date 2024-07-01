#ifndef LANGMODULE_H
#define LANGMODULE_H

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>

class VirtualKeyboardPlugin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QJsonArray row1 READ row1 NOTIFY dataChanged)
    Q_PROPERTY(QJsonArray row2 READ row2 NOTIFY dataChanged)
    Q_PROPERTY(QJsonArray row3 READ row3 NOTIFY dataChanged)
    Q_PROPERTY(QJsonArray row4 READ row4 NOTIFY dataChanged)
    Q_PROPERTY(QJsonArray row5 READ row5 NOTIFY dataChanged)
    Q_PROPERTY(QJsonArray row6 READ row6 NOTIFY dataChanged)

public:
    explicit VirtualKeyboardPlugin(QObject *parent = nullptr);

    QJsonArray row1() const;
    QJsonArray row2() const;
    QJsonArray row3() const;
    QJsonArray row4() const;
    QJsonArray row5() const;
    QJsonArray row6() const;

    Q_INVOKABLE void loadKeyboardData(const QString &lang);

signals:
    void dataChanged();

private:
    void parseKeyboardData(const QByteArray &data);

    QJsonArray m_row1;
    QJsonArray m_row2;
    QJsonArray m_row3;
    QJsonArray m_row4;
    QJsonArray m_row5;
    QJsonArray m_row6;
};

#endif // LANGMODULE_H
