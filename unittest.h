#ifndef UNITTEST_H
#define UNITTEST_H

#include <QObject>

class UnitTest : public QObject
{
    Q_OBJECT
public:
    explicit UnitTest(QObject *parent = nullptr);

signals:
};

#endif // UNITTEST_H
