--- @class Tile representing an UI bar. In this game player in some places can step on ui and mess up with values on it
UiBlankTile = Class { __includes = BaseTile }

function UiBlankTile:init(coordinates)
    self.coordinates = coordinates
    self.canBePicked = true
    self.type = 'UiTile'
end

function UiBlankTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", x, y, TILE_SIZE, TILE_SIZE)
end

--- Called whenever any entity enter the tile
function UiBlankTile:onEnter(entity, level)
end

function UiBlankTile:canEnter(entity)
    return true
end
