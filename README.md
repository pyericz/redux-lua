# redux-lua
Originally, redux is a predictable state container for JavaScript apps. From now on, you can use all the redux features on your Lua projects. Try it out! :-D

## Install 
redux-lua can be installed using LuaRocks ([http://luarocks.org/modules/pyericz/lredux](http://luarocks.org/modules/pyericz/lredux)):
```
luarocks install lredux
```

## Usage
Here is an example of profile updating. To get more usages, please checkout [examples](https://github.com/pyericz/redux-lua/tree/master/examples). 

### Actions (profile)
```lua
--[[
    actions/profile.lua
--]]
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

function actions.thunkCall()
    return function (dispatch, state)
        return dispatch(actions.updateAge(3))
    end
end

return actions
```

### Reducer (profile)
```lua
--[[
    reducers/profile.lua
--]]
local Object = require 'lredux.object'
local Null = require 'lredux.null'

local initState = {
    name = '',
    age = 0
}

local handlers = {
    ["PROFILE_UPDATE_NAME"] = function (state, action)
        return Object.assign(initState, state, {
            name = action.name
        })
    end,
    ["PROFILE_UPDATE_AGE"] = function (state, action)
        return Object.assign(initState, state, {
            age = action.age
        })
    end,
}

return function (state, action)
    state = state or Null
    local handler = handlers[action.type]
    if handler then
        return handler(state, action)
    end
    return state
end
```

### Combine reducers
```lua
--[[
    reducers/index.lua
--]]
local combineReducers = require 'lredux.combineReducers'
local profile = require 'reducers.profile'

return combineReducers({
    profile = profile
})
```

### Create store
```lua
--[[
    store.lua
--]]
local createStore = require 'lredux.createStore'
local reducers = require 'reducers.index'

local store = createStore(reducers)

return store
```

### Create store with middlewares
```lua
--[[
    store.lua
--]]
local createStore = require 'lredux.createStore'
local reducers = require 'reducers.index'
local applyMiddleware = require 'lredux.applyMiddleware'
local middlewares = require 'middlewares.index'

local store = createStore(reducers, applyMiddleware(table.unpack(middlewares)))

return store
```
### Dispatch & Subscription
```lua
--[[
    main.lua
--]]
local ProfileActions = require 'actions.profile'
local Inspect = require 'inspect'
local store = require 'store'

local function callback()
    print(Inspect(store.getState()))
end

-- subscribe dispatching
local unsubscribe = store.subscribe(callback)

-- dispatch actions
store.dispatch(ProfileActions.updateName('Jack'))
store.dispatch(ProfileActions.updateAge(10))
store.dispatch(ProfileActions.thunkCall())

-- unsubscribe
unsubscribe()
```

### Debug mode
redux-lua is on `Debug` mode by default. Messages with errors and warnings will be output when `Debug` mode is on. Use following code snippets to turn it off.
```lua
local Env = require 'lredux.env'
Env.setDebug(false)
```

### Null vs. nil
`nil` is not allowed as a reducer result. If you want any reducer to hold no value, you can return `Null` instead of `nil`.
```lua
local Null = require 'lredux.null'
```


## License
[MIT License](https://github.com/pyericz/redux-lua/blob/master/LICENSE)
