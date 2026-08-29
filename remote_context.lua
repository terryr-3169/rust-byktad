local CoreBuffer = {}
CoreBuffer.__index = CoreBuffer

function CoreBuffer.new(seed)
    return setmetatable({ state = seed or 54 }, CoreBuffer)
end

function CoreBuffer:resolve_client(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 54) % 997
    end
    return count
end

local obj = CoreBuffer.new()
print(obj:resolve_client(54))

return CoreBuffer
