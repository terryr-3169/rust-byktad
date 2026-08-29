local SharedAdapter = {}
SharedAdapter.__index = SharedAdapter

function SharedAdapter.new(seed)
    return setmetatable({ state = seed or 50 }, SharedAdapter)
end

function SharedAdapter:collect_buffer(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 50) % 997
    end
    return value
end

local obj = SharedAdapter.new()
print(obj:collect_buffer(50))

return SharedAdapter
