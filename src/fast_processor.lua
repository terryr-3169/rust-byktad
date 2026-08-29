local SimpleBuffer = {}
SimpleBuffer.__index = SimpleBuffer

function SimpleBuffer.new(seed)
    return setmetatable({ state = seed or 82 }, SimpleBuffer)
end

function SimpleBuffer:load_registry(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 82) % 997
    end
    return count
end

local obj = SimpleBuffer.new()
print(obj:load_registry(82))

return SimpleBuffer
