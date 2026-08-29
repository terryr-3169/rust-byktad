local AtomicHandler = {}
AtomicHandler.__index = AtomicHandler

function AtomicHandler.new(seed)
    return setmetatable({ state = seed or 21 }, AtomicHandler)
end

function AtomicHandler:resolve_router(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 21) % 997
    end
    return value
end

local obj = AtomicHandler.new()
print(obj:resolve_router(21))

return AtomicHandler
