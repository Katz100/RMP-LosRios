#include "networkmanager.h"

NetWorkManager::NetWorkManager(QObject *parent)
    : QObject{parent}
{
    m_request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
}

bool NetWorkManager::hasProfanity(const QString &text)
{
    m_request.setUrl(QUrl("https://tensor.profanity.dev"));

    QJsonObject json;
    json["message"] = text;
    QJsonDocument doc(json);
    QByteArray data = doc.toJson();
    QNetworkReply* reply = m_manager.post(m_request, data);

    QEventLoop eventLoop;
    connect(reply, &QNetworkReply::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();

    if(reply->error() == QNetworkReply::NoError)
    {
        QByteArray Response = reply->readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(Response);
        QJsonObject ResponseObject = jsonDoc.object();

        reply->deleteLater();

        double prediction = ResponseObject["prediction"].toDouble();
        qDebug() << "prediction: " << prediction;
        return (prediction > 0.7);
    }

    return false;

}
