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

bool Database::validateLogin(const QString &username, const QString &password)
{
    QSqlQuery query;
    query.prepare("SELECT COUNT(*) FROM users WHERE username = ? AND PASSWORD = ?;");
    query.bindValue(0, username);
    query.bindValue(1, password);

    if(!query.exec())
    {
        qDebug() << "validateLogin() error: " << query.lastError().text();
        return false;
    }

    if (query.next())
    {
        int count = query.value(0).toInt();
        return count == 1;

    }

    return false;

}

void Database::loginUser(const QString &username)
{
    setUsername(username);
    setLogginIn(true);
}

bool Database::isUsernameTaken(const QString &username)
{
    QSqlQuery query;
    query.prepare("SELECT COUNT(*) FROM users WHERE username = ?;");
    query.bindValue(0, username);

    if (!query.exec())
    {
        qDebug() << "isUsernameTaken() error" << query.lastError().text();
        return true;
    }

    if (query.next())
    {
        int count = query.value(0).toInt();
        return count > 0;
    }

    return false;
}

void Database::registerUser(const QString &username, const QString &password)
{
    QSqlQuery query;
    query.prepare("INSERT INTO Users (id, username, password) VALUES"
                  "(DEFAULT, ?, ?);");
    query.bindValue(0, username);
    query.bindValue(1, password);
    int id;
    if (!query.exec())
    {
        qDebug() << "registerUser() error" << query.lastError().text();
        return;
    }
    id = query.lastInsertId().toInt();
    QSqlQuery insert;
    insert.prepare("INSERT INTO UserRoles (user_id, role_id) VALUES (?, ?);");
    insert.bindValue(0, id);
    insert.bindValue(1, static_cast<int>(UserRole::user));
    if (!insert.exec())
    {
        qDebug() << insert.lastError().text();
    }
}
