--- @class Tile representing unreachable wall
WallTile = Class { __includes = BaseTile }


function WallTile:init(coordinates)
    self.coordinates = coordinates
    self.canBePicked = false
    self.type = 'WallTile'
end

function WallTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", x, y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(.6, .3, .1, 1)
    love.graphics.rectangle("fill", x + 1, y + 1, TILE_SIZE - 2, TILE_SIZE - 2)
end

--- Called whenever any entity enter the tile
function WallTile:onEnter(entity, level)
end

function WallTile:canEnter(entity)
    return false
end
