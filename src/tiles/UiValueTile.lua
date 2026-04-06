--- @class Tile representing a numeric/text value on UI bar
UiValueTile = Class { __includes = BaseTile }

function UiValueTile:init(coordinates, value)
    self.coordinates = coordinates
    self.canBePicked = true
    self.value = value
    self.type = 'UiValueTile'
end

function UiValueTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", x, y, TILE_SIZE, TILE_SIZE)


    local font = love.graphics.getFont()
    love.graphics.setColor(0, 0, 0, 1)

    love.graphics.printf(
        self.value,
        x + TILE_SIZE / 2 - font:getWidth(self.value) / 2,
        y + TILE_SIZE / 2 - font:getHeight() / 2,
        TILE_SIZE
    )
end

--- Called whenever any entity enter the tile
function UiValueTile:onEnter(entity, level)
end

function UiValueTile:canEnter(entity)
    return true
end
