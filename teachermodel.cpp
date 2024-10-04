#include "teachermodel.h"

TeacherModel::TeacherModel(QObject *parent)
    : QAbstractListModel{parent}
{}


int TeacherModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_data.count();
}

QVariant TeacherModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Data &data = m_data.at(index.row());
    switch (role) {
    case TeacherIdRole:
        return data.teacher_id;
    case NameRole:
        return data.name;

    default:
        return QVariant();
    }
}


QHash<int, QByteArray> TeacherModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {TeacherIdRole, "teacher_id"},
        {NameRole, "name"}
    };
    return mapping;
}

void TeacherModel::addData(QVariantList data)
{
    beginResetModel();
    m_data.clear();
    endResetModel();

    beginInsertRows(QModelIndex(), 0, data.length()-1);
    for (int i = 0; i < data.length(); i++)
    {
        int teacher_id = data[i].toMap().value("teacher_id").toInt();
        QString name = data[i].toMap().value("name").toString();

        const Data teacher(teacher_id, name);
        m_data.append(teacher);
    }
    endInsertRows();
}

void TeacherModel::removeData(int row)
{

}

