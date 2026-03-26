-- Divides sprite sheet to single sprites
function GenerateQuads(spriteSheet, numColumns)
    assert(spriteSheet ~= nil)
    assert(numColumns ~= nil)
    local width = spriteSheet:getWidth()
    local tileWidth = TILE_SIZE
    local tileHeight = TILE_SIZE

    local spriteIndex = 1
    local quads = {}

    local numItemsInRow = width / tileWidth
    for i = 0, numColumns - 1, 1 do
        for j = 0, numItemsInRow - 1, 1 do
            quads[spriteIndex] = love.graphics.newQuad(j * tileWidth, i * tileHeight, tileWidth, tileHeight,
                spriteSheet:getDimensions())
            spriteIndex = spriteIndex + 1
        end
    end

    return quads
end
