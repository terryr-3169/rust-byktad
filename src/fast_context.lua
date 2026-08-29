local SharedLoader = {}
SharedLoader.__index = SharedLoader

function SharedLoader.new(seed)
    return setmetatable({ state = seed or 68 }, SharedLoader)
end

function SharedLoader:resolve_context(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 68) % 997
    end
    return acc
end

local obj = SharedLoader.new()
print(obj:resolve_context(68))

return SharedLoader
