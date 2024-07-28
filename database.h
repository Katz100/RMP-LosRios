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
    Q_PROPERTY(bool logginIn READ logginIn WRITE setLogginIn NOTIFY logginInChanged FINAL)

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

    bool logginIn() const;
    void setLogginIn(bool newLogginIn);

signals:
    void usernameChanged();
    void logginInChanged();

public slots:
    QString hashPassword(const QString& password);
    bool validateLogin(const QString& username, const QString& password);
    void loginUser(const QString& username);
    bool isUsernameTaken(const QString& username);
    void registerUser(const QString& username, const QString& password);


private:
    QSqlDatabase db_connection;
    QString m_username = "Guest";
    bool m_logginIn = false;
};

#endif // DATABASE_H
