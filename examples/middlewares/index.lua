local logger = require 'middlewares.logger'
local thunk = require 'middlewares.thunk'

local middlewares = {
    thunk,
    logger,
}

return middlewares
