var teacherName = ""

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
