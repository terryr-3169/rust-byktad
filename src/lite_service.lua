local CoreBuffer = {}
CoreBuffer.__index = CoreBuffer

function CoreBuffer.new(seed)
    return setmetatable({ state = seed or 85 }, CoreBuffer)
end

function CoreBuffer:build_cache(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 85) % 997
    end
    return value
end

local obj = CoreBuffer.new()
print(obj:build_cache(85))

return CoreBuffer
