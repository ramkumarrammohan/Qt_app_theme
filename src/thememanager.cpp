#include "thememanager.h"

#include <QQmlComponent>
#include <QQmlContext>
#include <QDebug>

static ThemeManager *s_instance = nullptr;
const QString ThemeObjName = "Theme";

ThemeManager::ThemeManager() :
    _qmlEngine(nullptr)
{
}

ThemeManager::~ThemeManager()
{
    delete s_instance;
    delete _qmlEngine;
}

ThemeManager *ThemeManager::getInstance()
{
    if (s_instance == nullptr)
    {
        s_instance = new ThemeManager;
    }

    return s_instance;
}

void ThemeManager::initTheme(QQmlApplicationEngine *engine)
{
    if (!engine)
        return;

    _qmlEngine = engine;
    changeTheme();
}

void ThemeManager::changeTheme(bool light)
{
    // Check for existing Theme Obj if any found delete.
    QObject* oldTheme = _qmlEngine->rootContext()->contextProperty(ThemeObjName).value<QObject*>();
    if (oldTheme)
        oldTheme->deleteLater();

    if (light)
    {
        // load light theme qml into context
        QQmlComponent themeComponent(_qmlEngine, QUrl("qrc:/qml/ThemeLight.qml"));
        if (!themeComponent.isReady()|| themeComponent.isNull())
        {
            qWarning() << "Component not loaded properly";
        }
        QObject* themeObj = qobject_cast<QObject *>(themeComponent.create());
        _qmlEngine->rootContext()->setContextProperty(ThemeObjName, themeObj);
    }
    else
    {
        // load dark theme qml into context
        QQmlComponent themeComponent(_qmlEngine, QUrl("qrc:/qml/ThemeDark.qml"));
        if (!themeComponent.isReady() || themeComponent.isNull())
        {
            qWarning() << "Component not loaded properly";
        }
        QObject* themeObj = qobject_cast<QObject *>(themeComponent.create());
        _qmlEngine->rootContext()->setContextProperty(ThemeObjName, themeObj);
    }
}
