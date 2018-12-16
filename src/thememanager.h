#pragma once

#include <QQmlApplicationEngine>

class ThemeManager
{
public:
    ~ThemeManager();

    static ThemeManager* getInstance();

    //! API's exposed to change the app theme
    void initTheme(QQmlApplicationEngine *engine);
    void changeTheme(bool light = true);

private:
    QQmlApplicationEngine *_qmlEngine;

    explicit ThemeManager();
};
