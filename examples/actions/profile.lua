local actions = {}

function actions.updateName(name)
    return {
        type = "PROFILE_UPDATE_NAME",
        name = name
    }
end

function actions.updateAge(age)
    return {
        type = "PROFILE_UPDATE_AGE",
        age = age
    }
end

return actions
