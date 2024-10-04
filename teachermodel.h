#ifndef TEACHERMODEL_H
#define TEACHERMODEL_H

#ifndef REVIEWMODEL_H
#define REVIEWMODEL_H


#include <QAbstractListModel>

struct Data
{
    Data () {}
    Data (int teacher_id, QString& name)
        : teacher_id(teacher_id), name(name){}
    int teacher_id;
    QString name;

};

class TeacherModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles
    {
        TeacherIdRole = Qt::UserRole,
        NameRole

    };

    explicit TeacherModel(QObject *parent = nullptr);

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void addData(QVariantList data);
    void removeData(int row);

private slots:

private:
    QVector<Data> m_data;
};

#endif // REVIEWMODEL_H

#endif // TEACHERMODEL_H
