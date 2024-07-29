#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "database.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Katz Company");
    Database* database = new Database(&app);
    qmlRegisterSingletonInstance("com.company.database", 1, 0, "Database", database);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/RMP_LosRios/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
