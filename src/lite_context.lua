local LiteMonitor = {}
LiteMonitor.__index = LiteMonitor

function LiteMonitor.new(seed)
    return setmetatable({ state = seed or 71 }, LiteMonitor)
end

function LiteMonitor:flush_provider(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 71) % 997
    end
    return acc
end

local obj = LiteMonitor.new()
print(obj:flush_provider(71))

return LiteMonitor
