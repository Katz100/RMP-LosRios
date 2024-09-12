#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QCryptographicHash>
#include <QStringListModel>
#include <QSortFilterProxyModel>
#include <QRandomGenerator>

class Database : public QObject
{
    Q_OBJECT
public:
    explicit Database(QObject *parent = nullptr);

    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged FINAL)
    Q_PROPERTY(bool loggedIn READ loggedIn WRITE setLoggedIn NOTIFY loggedInChanged FINAL)
    Q_PROPERTY(bool connected READ connected WRITE setConnected NOTIFY connectedChanged FINAL)
    QStringListModel SuggestionModel;

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
    bool validateLogin(const QString& username, const QString& password);
    bool isUsernameTaken(const QString& username);

    void loginUser(const QString& username);
    void registerUser(const QString& username, const QString& password, const QString& salt);
    void logout();
    void changeUsername(const QString& new_username);
    void setSchool(int id);
    void deleteUser();
    void getTeacherNameSuggestions();

    int getUserId();
    int getSchoolId();
    int countTeacherRatings(int teacher_id);
    int getRatings(int teacher_id, int rating_number);

    double getAverageRating(int teacher_id);
    double getAverageDifficulty(int teacher_id);

    QString getTeacher(int id);
    QString getCourse(int id);
    QString generateSalt();
    QString getUserSalt(const QString& username);
    QString hashPassword(const QString& password);

    QVariantList getUserReviews();
    QVariantList getTeacherReviews(int teacher_id);
    QVariantList getTeachers(const QString& teacher_name);


private:
    QSqlDatabase db_connection;
    QString m_username = "Guest";
    bool m_loggedIn = false;
    bool m_connected = true;
    QStringList m_suggestions;
};

#endif // DATABASE_H
