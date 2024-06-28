#ifndef VIRTUALKEYBOARDPLUGIN_H
#define VIRTUALKEYBOARDPLUGIN_H

#include <QObject>

class VirtualKeyboardPlugin : public QObject
{
    Q_OBJECT
public:
    explicit VirtualKeyboardPlugin(QObject *parent = nullptr);

signals:
    void keyPressed(QString key);

public slots:
    void handleKeyPress(QString key);
};

#endif // VIRTUALKEYBOARDPLUGIN_H
