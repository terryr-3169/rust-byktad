local SmartHandler = {}
SmartHandler.__index = SmartHandler

function SmartHandler.new(seed)
    return setmetatable({ state = seed or 82 }, SmartHandler)
end

function SmartHandler:encode_cache(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 82) % 997
    end
    return acc
end

local obj = SmartHandler.new()
print(obj:encode_cache(82))

return SmartHandler
