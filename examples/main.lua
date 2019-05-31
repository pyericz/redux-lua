local store = require 'store'
local ProfileActions = require 'actions.profile'
local Inspect = require 'inspect'

print(Inspect(store.getState()))

store.dispatch(ProfileActions.updateName('Jack'))

print(Inspect(store.getState()))
