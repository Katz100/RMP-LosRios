#include "database.h"
#include "config.h"

Database::Database(QObject *parent)
    : QObject{parent}
{
    db_connection = QSqlDatabase::addDatabase("QPSQL");
    db_connection.setHostName(host);
    db_connection.setDatabaseName("Rmp-Test");
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
        setConnected(false);
    }

}

//return true if succesfully connected to database, otherwise, return false.
bool Database::connectToDatabase()
{
    if(!db_connection.open())
    {
        return db_connection.open();
    }

    return false;
}

bool Database::isConnected()
{
    return db_connection.isOpen();
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

bool Database::loggedIn() const
{
    return m_loggedIn;
}

void Database::setLoggedIn(bool newloggedIn)
{
    if (m_loggedIn == newloggedIn)
        return;
    m_loggedIn = newloggedIn;
    emit loggedInChanged();
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
    setLoggedIn(true);
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

void Database::logout()
{
    setUsername("Guest");
    setLoggedIn(false);
}

int Database::getSchoolId()
{
    QSqlQuery query;
    query.prepare("SELECT school_id "
                  "FROM Users "
                  "JOIN SchoolRole ON users.id = SchoolRole.user_id "
                  "WHERE username = ?;");
    query.bindValue(0, m_username);
    if (!query.exec())
    {
        qDebug() << "getSchoolId() error" << query.lastError().text();
        return -1;
    }

    if (query.next())
    {
        return query.value(0).toInt();
    }

    return -1;
}

void Database::changeUsername(const QString &new_username)
{
    QSqlQuery query;
    query.prepare("UPDATE Users"
                  " SET username = ?"
                  " WHERE username = ?");
    query.bindValue(0, new_username);
    query.bindValue(1, username());
    if (!query.exec())
    {
        qDebug() << "changeUsername() error: " << query.lastError().text();
        return;
    }

    setUsername(new_username);
}

void Database::setSchool(int id)
{
    QSqlQuery getIdQuery;
    getIdQuery.prepare("SELECT id FROM Users WHERE username = ?");
    getIdQuery.bindValue(0, username().toLower());
    if (!getIdQuery.exec())
    {
        qDebug() << "get id error: " << getIdQuery.lastError().text();
        return;
    }

    int userId = 0;

    if (getIdQuery.next())
    {
        userId = getIdQuery.value(0).toInt();
    }
    qDebug() << "id: " << userId;
    QSqlQuery query;
    query.prepare("INSERT INTO SchoolRole (user_id, school_id)"
                  " VALUES (?, ?)"
                  " ON CONFLICT (user_id) DO UPDATE SET"
                  " school_id = EXCLUDED.school_id");
    query.bindValue(0, userId);
    query.bindValue(1, id);
    if(!query.exec())
    {
        qDebug() << "setSchool() error" << query.lastError().text();
    }
}



bool Database::connected() const
{
    return m_connected;
}

void Database::setConnected(bool newConnected)
{
    if (m_connected == newConnected)
        return;
    m_connected = newConnected;
    emit connectedChanged();
}

