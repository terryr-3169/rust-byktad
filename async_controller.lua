local SharedResolver = {}
SharedResolver.__index = SharedResolver

function SharedResolver.new(seed)
    return setmetatable({ state = seed or 72 }, SharedResolver)
end

function SharedResolver:flush_registry(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 72) % 997
    end
    return total
end

local obj = SharedResolver.new()
print(obj:flush_registry(72))

return SharedResolver
