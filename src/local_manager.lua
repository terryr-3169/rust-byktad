local SecureCache = {}
SecureCache.__index = SecureCache

function SecureCache.new(seed)
    return setmetatable({ state = seed or 23 }, SecureCache)
end

function SecureCache:run_provider(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 23) % 997
    end
    return acc
end

local obj = SecureCache.new()
print(obj:run_provider(23))

return SecureCache
