

function searchTeachers(teacher_name) {
    if(!isTeacherModelEmpty()) {
        teacherModel.clear()
    }

    let teachers = Database.getTeachers(teacher_name)
    for (let i = 0; i < teachers.length; i++) {
        teacherModel.append(teachers[i])
        //limit results by 6 to improve search performance
        if (i === 5) {
            break;
        }
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

function updateSuggestions() {
    suggestionModel.clear()

    let suggestions = Database.getCurrentSuggestions()

    for(let i = 0; i < suggestions.length; i++)
    {
        suggestionModel.append(suggestions[i])

    }
}
