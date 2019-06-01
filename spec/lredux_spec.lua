local ProfileActions = require 'examples.actions.profile'
-- local inspect = require 'inspect'
local store = require 'examples.store'

-- local function callback()
--     print(inspect(store.getState()))
-- end

-- -- subscribe dispatching
-- local unsubscribe = store.subscribe(callback)

-- -- dispatch actions
-- store.dispatch(ProfileActions.updateAge(10))
-- store.dispatch(ProfileActions.thunkCall())

-- -- unsubscribe
-- unsubscribe()


describe('lredux', function ()
    describe('state', function ()
        it('works', function ()
            store.dispatch(ProfileActions.updateName('Jack'))
            local state = store.getState()
            assert.equals(state.profile.name, 'Jack')
        end)
    end)
end)
