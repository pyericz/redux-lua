local createStore = require 'lredux.createStore'
local reducers = require 'examples.reducers.index'
local applyMiddleware = require 'lredux.applyMiddleware'
local middlewares = require 'examples.middlewares.index'

local store = createStore(reducers, applyMiddleware(table.unpack(middlewares)))

return store
