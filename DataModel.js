

function searchTeachers(teacher_name) {
    let teachers = Database.getTeachers(teacher_name)
    _teacherModel.addData(teachers)
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

function updateSuggestions() {
    suggestionModel.clear()

    let suggestions = Database.getCurrentSuggestions()

    for(let i = 0; i < suggestions.length; i++)
    {
        suggestionModel.append(suggestions[i])

    }
}
