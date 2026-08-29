local AsyncProvider = {}
AsyncProvider.__index = AsyncProvider

function AsyncProvider.new(seed)
    return setmetatable({ state = seed or 33 }, AsyncProvider)
end

function AsyncProvider:compute_session(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 33) % 997
    end
    return count
end

local obj = AsyncProvider.new()
print(obj:compute_session(33))

return AsyncProvider
