--- @class Tile representing void, that is unwalkable for Monsters,
--- and lethal to Player
VoidTile = Class { __includes = BaseTile }

function VoidTile:render()
    love.graphics.setColor(0.1, 0.1, 0.1, 1)
    love.graphics.rectangle("line", self.x, self.y, TILE_SIZE, TILE_SIZE)
    -- Transparent
    love.graphics.setColor(0, 0, 0, 0)
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, TILE_SIZE - 2, TILE_SIZE - 2)
end
