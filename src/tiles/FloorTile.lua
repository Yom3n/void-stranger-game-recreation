FloorTile = Class { __includes = BaseTile }

function FloorTile:init(coordinates)
    self.coordinates = coordinates
    self.canBePicked = true
    self.type = 'FloorTile'
end

function FloorTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Sprites.characterSheet, TileQuads.floor, x, y)
end

--- Called whenever any entity enter the tile
function FloorTile:onEnter(entity, level)
end

function FloorTile:canEnter(entity)
    return true
end