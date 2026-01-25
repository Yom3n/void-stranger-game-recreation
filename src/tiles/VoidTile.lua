--- @class Tile representing void, that is unwalkable for Monsters,
--- and lethal to Player
VoidTile = Class { __includes = BaseTile }

function VoidTile:render()
    love.graphics.setColor(0.1, 0.1, 0.1, 1)
    love.graphics.rectangle("line", self.x, self.y, TILE_SIZE, TILE_SIZE)
    -- Void tile is transparent, so no sprite/rectangle is needed 
end
