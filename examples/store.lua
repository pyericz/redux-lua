local createStore = require 'lredux.createStore'
local reducers = require 'reducers.index'
local applyMiddleware = require 'lredux.applyMiddleware'
local middlewares = require 'middlewares.index'

local store = createStore(reducers, applyMiddleware(table.unpack(middlewares)))

return store
