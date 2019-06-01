local createStore = require 'lredux.createStore'
local reducers = require 'examples.reducers.index'
local applyMiddleware = require 'lredux.applyMiddleware'
local middlewares = require 'examples.middlewares.index'

local unpack = unpack or table.unpack

local store = createStore(reducers, applyMiddleware(unpack(middlewares)))

return store
