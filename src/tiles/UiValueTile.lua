--- @class Tile representing a numeric/text value on UI bar
UiValueTile = Class { __includes = BaseTile }

--- get value is a function that returns string value
function UiValueTile:init(coordinates, getValue)
    assert(coordinates ~= nil)
    assert(getValue ~= nil)
    self.coordinates = coordinates
    self.canBePicked = true
    self.getValue = getValue
    self.type = 'UiValueTile'
end

function UiValueTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", x, y, TILE_SIZE, TILE_SIZE)

    local font = Fonts.big
    love.graphics.setFont(font)
    love.graphics.setColor(0, 0, 0, 1)

    local value = self.getValue()
    assert(value ~= nil)
    local valueStr = tostring(value)
    love.graphics.printf(
        valueStr,
        x + TILE_SIZE / 2 - font:getWidth(valueStr) / 2,
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
