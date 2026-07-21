-- Divides sprite sheet to single sprites
function GenerateQuads(spriteSheet, numColumns)
    assert(spriteSheet ~= nil)
    assert(numColumns ~= nil)
    local width = spriteSheet:getWidth()
    local tileWidth = TILE_SIZE
    local tileHeight = TILE_SIZE

    local quads = {}

    local numItemsInRow = width / tileWidth
    for i = 0, numColumns - 1, 1 do
        if quads[i] == nil then
            quads[i] = {}
        end
        for j = 0, numItemsInRow - 1, 1 do
            quads[i][j] = love.graphics.newQuad(
                j * tileWidth,
                i * tileHeight,
                tileWidth, tileHeight,
                spriteSheet:getDimensions()
            )
        end
    end

    return quads
end
