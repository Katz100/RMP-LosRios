#include "database.h"
#include "config.h"

Database::Database(QObject *parent)
    : QObject{parent}
{
    db_connection = QSqlDatabase::addDatabase("QPSQL");
    db_connection.setHostName(host);
    db_connection.setDatabaseName("RMP");
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
