#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <controller/system.h>
#include <controller/hvachandler.h>
#include <QQmlContext>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TeslaUIDemo", "Main");

    QQmlContext* context (engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHVAC", &m_driverHVACHandler);
    context->setContextProperty("passengerHVAC", &m_passengerHVACHandler);

    return app.exec();
}
