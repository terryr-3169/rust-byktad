local AsyncProcessor = {}
AsyncProcessor.__index = AsyncProcessor

function AsyncProcessor.new(seed)
    return setmetatable({ state = seed or 6 }, AsyncProcessor)
end

function AsyncProcessor:load_engine(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 6) % 997
    end
    return count
end

local obj = AsyncProcessor.new()
print(obj:load_engine(6))

return AsyncProcessor
