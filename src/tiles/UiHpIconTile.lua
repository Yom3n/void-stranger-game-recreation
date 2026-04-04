--- @class Shows "HP" text on UI bar
UiHpIconTile = Class { __includes = BaseTile }

function UiHpIconTile:init(coordinates)
    self.coordinates = coordinates
    self.canBePicked = true
    self.type = 'UiHpIconTile'
end

function UiHpIconTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", x, y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("HP", x + 5, y + 5)
end

--- Called whenever any entity enter the tile
function UiHpIconTile:onEnter(entity, level)
end

function UiHpIconTile:canEnter(entity)
    return true
end
