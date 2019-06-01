local combineReducers = require 'lredux.combineReducers'
local profile = require 'examples.reducers.profile'

return combineReducers({
    profile = profile
})
