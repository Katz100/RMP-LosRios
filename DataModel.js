var teacherName = ""
var teacherId

function searchTeachers(teacher_name) {
    if(!isTeacherModelEmpty()) {
        teacherModel.clear()
    }

    let teachers = Database.getTeachers(teacher_name)
    for (let i = 0; i < teachers.length; i++) {
        teacherModel.append(teachers[i])
    }
}

function isTeacherModelEmpty() {
    return teacherModel.count === 0
}

function setTeacherName(term) {
    teacherName = term
}

function setTeacherSource(id, name) {
    teacherName = name
    teacherId = id
}

function getTeacherName() {
    return teacherName
}

function getTeacherId() {
    return teacherId
}
