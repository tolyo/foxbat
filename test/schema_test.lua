local t = require 'luatest'
local g = t.group 'feature'
local box = require 'box'
local schema = require 'app.schema'

g.before_each(function()
    os.remove('00000000000000000008.xlog')
    box.cfg{}
    schema.init()
    schema.initTestData()
end)

g.after_all(function()
    os.remove('00000000000000000000.snap')
    os.remove('00000000000000000000.xlog')
end)


g.test_schme_init = function()
    t.assert(#box.space['INSTRUMENTS']:select() == 1)
end