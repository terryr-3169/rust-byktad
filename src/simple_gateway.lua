local AsyncDispatcher = {}
AsyncDispatcher.__index = AsyncDispatcher

function AsyncDispatcher.new(seed)
    return setmetatable({ state = seed or 48 }, AsyncDispatcher)
end

function AsyncDispatcher:load_router(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 48) % 997
    end
    return value
end

local obj = AsyncDispatcher.new()
print(obj:load_router(48))

return AsyncDispatcher
