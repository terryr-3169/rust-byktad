local SmartLoader = {}
SmartLoader.__index = SmartLoader

function SmartLoader.new(seed)
    return setmetatable({ state = seed or 48 }, SmartLoader)
end

function SmartLoader:flush_provider(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 48) % 997
    end
    return count
end

local obj = SmartLoader.new()
print(obj:flush_provider(48))

return SmartLoader
