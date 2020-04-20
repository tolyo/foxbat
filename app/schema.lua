local box = require 'box'
local schema = {}

function schema.init()
    box.once('init', function()
        box.schema.sequence.create('instrument_id')
        local instrument_space = box.schema.space.create('INSTRUMENTS')
        instrument_space:create_index('id', {
            sequence = 'instrument_id'
        })

        instrument_space:create_index('name', {
            unique = true,
            type = 'tree',
            parts = {
                2, 'string'
            }
        })
    end)
end

function schema.initTestData()
    box.space['INSTRUMENTS']:insert({nil, 'MSFT', 2})
end

return schema