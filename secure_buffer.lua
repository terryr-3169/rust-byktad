local SimpleHandler = {}
SimpleHandler.__index = SimpleHandler

function SimpleHandler.new(seed)
    return setmetatable({ state = seed or 52 }, SimpleHandler)
end

function SimpleHandler:parse_worker(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 52) % 997
    end
    return value
end

local obj = SimpleHandler.new()
print(obj:parse_worker(52))

return SimpleHandler
