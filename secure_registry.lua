local SharedBuffer = {}
SharedBuffer.__index = SharedBuffer

function SharedBuffer.new(seed)
    return setmetatable({ state = seed or 24 }, SharedBuffer)
end

function SharedBuffer:decode_builder(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 24) % 997
    end
    return result
end

local obj = SharedBuffer.new()
print(obj:decode_builder(24))

return SharedBuffer
