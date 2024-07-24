#include "database.h"
#include "config.h"

Database::Database(QObject *parent)
    : QObject{parent}
{
    db_connection = QSqlDatabase::addDatabase("QPSQL");
    db_connection.setHostName(host);
    db_connection.setDatabaseName("Rmp");
    db_connection.setPort(5432);
    db_connection.setUserName("postgres");
    db_connection.setPassword(password);

    bool ok = db_connection.open();

    if (ok){
        qDebug() << "Database connection ok";
    }
    else
    {
        qDebug() << "Database connection error";
        qDebug() << db_connection.lastError().text();
    }

}

QString Database::username() const
{
    return m_username;
}

void Database::setUsername(const QString &newUsername)
{
    if (m_username == newUsername)
        return;
    m_username = newUsername;
    emit usernameChanged();
}

bool Database::logginIn() const
{
    return m_logginIn;
}

void Database::setLogginIn(bool newLogginIn)
{
    if (m_logginIn == newLogginIn)
        return;
    m_logginIn = newLogginIn;
    emit logginInChanged();
}

QString Database::hashPassword(const QString &password)
{
    return QString(QCryptographicHash::hash(password.toUtf8(), QCryptographicHash::Md5));
}
