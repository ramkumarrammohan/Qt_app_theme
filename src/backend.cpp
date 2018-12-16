#include "backend.h"
#include "thememanager.h"

Backend::Backend(QObject *parent) : QObject(parent)
{

}

void Backend::changeTheme(bool flag)
{
    ThemeManager::getInstance()->changeTheme(flag);
}
