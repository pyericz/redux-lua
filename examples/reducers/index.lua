local combineReducers = require 'lredux.combineReducers'
local profile = require 'reducers.profile'

return combineReducers({
    profile = profile
})
