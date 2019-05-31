local store = require 'store'
local ProfileActions = require 'actions.profile'

store.dispatch(ProfileActions.updateName('Jack'))
store.dispatch(ProfileActions.updateAge(10))
store.dispatch(ProfileActions.thunkCall())
