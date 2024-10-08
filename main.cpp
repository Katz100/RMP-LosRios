#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QQuickView>
#include "database.h"
#include "networkmanager.h"
#include "teachermodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Katz Company");
    Database* database = new Database(&app);
    qmlRegisterSingletonInstance("com.company.database", 1, 0, "Database", database);

    NetWorkManager* network = new NetWorkManager(&app);
    qmlRegisterSingletonInstance("com.company.network", 1, 0, "Network", network);

    TeacherModel teacherModel;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("_teacherModel", &teacherModel);

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
