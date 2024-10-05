#include "teachermodel.h"

TeacherModel::TeacherModel(QObject *parent)
    : QAbstractListModel{parent}
{}


int TeacherModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_loadedCount;
}

QVariant TeacherModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_loadedCount)
        return QVariant();

    const int row = index.row();
    if (row >= m_data.size() || row < 0)
        return QVariant();

    switch (role) {
    case TeacherIdRole:
        return m_data.at(row).teacher_id;
    case NameRole:
        qDebug() << m_data.at(row).name;
        return m_data.at(row).name;

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
    clearData();

    //beginInsertRows(QModelIndex(), 0, data.length()-1);
    for (int i = 0; i < data.length(); i++)
    {
        int teacher_id = data[i].toMap().value("teacher_id").toInt();
        QString name = data[i].toMap().value("name").toString();

        const Data teacher(teacher_id, name);
        m_data.append(teacher);
    }
    //endInsertRows();
    endResetModel();

}

void TeacherModel::clearData()
{
    beginRemoveRows(QModelIndex(), 0, m_data.length() - 1);
    m_data.clear();
    m_loadedCount = 0;
    endRemoveRows();
}

void TeacherModel::removeData(int row)
{

}



void TeacherModel::fetchMore(const QModelIndex &parent)
{
    if (parent.isValid())
        return;

    const int remainder = m_data.count() - m_loadedCount;
    int itemsToFetch = qMin(m_batchSize, remainder);



    if (itemsToFetch <= 0)
        return;

    beginInsertRows(QModelIndex(), m_loadedCount, m_loadedCount + itemsToFetch - 1);

    m_loadedCount += itemsToFetch;

    endInsertRows();
}


bool TeacherModel::canFetchMore(const QModelIndex &parent) const
{
    if (parent.isValid())
        return false;
    return m_loadedCount < m_data.size();
}

