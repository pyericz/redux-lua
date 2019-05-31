local Inspect = require 'inspect'
local Logger = {}
local Env = require 'lredux.env'

local unpack = unpack or table.unpack

local print = _G["print"]

local function prettyPrint(tag, ...)
    if Env.isDebug() then return end
    local msgs = {...}
    for i=1, #msgs do
        if type(msgs[i]) ~= 'string' then
            msgs[i] = Inspect(msgs[i])
        end
    end
    print(tag, unpack(msgs))
    print('')
end

local function prettyPrintTrace(tag, ...)
    if Env.isDebug() then return end
    local msgs = {...}
    for i=1, #msgs do
        if type(msgs[i]) ~= 'string' then
            msgs[i] = Inspect(msgs[i])
        end
    end
    print(tag, unpack(msgs))
    print(debug.traceback('', 3))
    print('')
end

function Logger.info(...)
    prettyPrint('[INFO]', ...)
end

function Logger.log(...)
    prettyPrint('[LOG]', ...)
end

function Logger.debug(...)
    prettyPrintTrace('[DEBUG]', ...)
end

function Logger.warn(...)
    prettyPrint('[WARN]', ...)
end

function Logger.error(...)
    prettyPrintTrace('[ERROR]', ...)
end

return Logger
