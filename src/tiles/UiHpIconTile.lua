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


    local font = love.graphics:getFont()
    love.graphics.setColor(0, 0, 0, 1)

    local text = "HP"
    love.graphics.printf(
        text,
        x + TILE_SIZE / 2 - font:getWidth(text) / 2,
        y + TILE_SIZE / 2 - font:getHeight() / 2,
        TILE_SIZE
    )
end

--- Called whenever any entity enter the tile
function UiHpIconTile:onEnter(entity, level)
end

function UiHpIconTile:canEnter(entity)
    return true
end
