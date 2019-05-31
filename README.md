# redux-lua
Originally, redux is a predictable state container for JavaScript apps. From now on, you can use all the redux features on your Lua projects. Try it out!

## Install 
redux-lua can be installed using luarocks ([http://luarocks.org/modules/pyericz/lredux](http://luarocks.org/modules/pyericz/lredux)):
```
luarocks install lredux
```

## Usage
Checkout [examples](https://github.com/pyericz/redux-lua/tree/master/examples) for more ways to use it.

### Debug mode
`lredux` is on `Debug` mode by default. Messages with errors and warnings will be output when `Debug` mode is on. Use following code snippets to turn it off.
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
