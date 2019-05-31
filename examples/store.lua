local createStore = require 'lredux.createStore'
local reducers = require 'reducers.index'
local store = createStore(reducers)

return store
