#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QCoreApplication>
#include <QSslSocket>

class NetWorkManager : public QObject
{
    Q_OBJECT
public:
    explicit NetWorkManager(QObject *parent = nullptr);

signals:

public slots:
    bool hasProfanity(const QString& text);
    bool usernameHasProfanity(const QString& username);
private:
    QNetworkAccessManager m_manager;
    QNetworkRequest m_request;
};

#endif // NETWORKMANAGER_H
