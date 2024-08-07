#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QCryptographicHash>

class Database : public QObject
{
    Q_OBJECT
public:
    explicit Database(QObject *parent = nullptr);

    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged FINAL)
    Q_PROPERTY(bool loggedIn READ loggedIn WRITE setLoggedIn NOTIFY loggedInChanged FINAL)
    Q_PROPERTY(bool connected READ connected WRITE setConnected NOTIFY connectedChanged FINAL)

    enum class UserRole
    {
        user = 1,
        admin,
        mod,
        teacher
    };

    Q_ENUM(UserRole)

    enum class School
    {
        FLC = 1,
        ARC,
        SCC,
        CRC
    };

    Q_ENUM(School)

    QString username() const;
    void setUsername(const QString &newUsername);

    bool loggedIn() const;
    void setLoggedIn(bool newloggedIn);

    bool connected() const;
    void setConnected(bool newConnected);

signals:
    void usernameChanged();
    void loggedInChanged();

    void connectedChanged();

public slots:
    bool connectToDatabase();
    bool isConnected();
    QString hashPassword(const QString& password);
    bool validateLogin(const QString& username, const QString& password);
    void loginUser(const QString& username);
    bool isUsernameTaken(const QString& username);
    void registerUser(const QString& username, const QString& password);
    void logout();
    int getSchoolId();


private:
    QSqlDatabase db_connection;
    QString m_username = "Guest";
    bool m_loggedIn = false;
    bool m_connected = true;
};

#endif // DATABASE_H
