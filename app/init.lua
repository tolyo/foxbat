local conf = require 'config'
local log = require 'log'

box.once('access:v1', function()
    box.schema.user.grant('guest', 'read,write,execute', 'universe')
    -- Uncomment this to create user foxbat_user
    -- box.schema.user.create('foxbat_user', { password = 'foxbat_pass' })
    -- box.schema.user.grant('foxbat_user', 'read,write,execute', 'universe')
end)

local app = {
    mod1 = require 'mod1',
}

function app.init(config)
    log.info('app "foxbat" init')


    for k, mod in pairs(app) do if type(mod) == 'table' and mod.init ~= nil then mod.init(config) end end
end

function app.destroy()
    log.info('app "foxbat" destroy')

    for k, mod in pairs(app) do if type(mod) == 'table' and mod.destroy ~= nil then mod.destroy() end end
end

package.reload:register(app)
rawset(_G, 'app', app)
return app
