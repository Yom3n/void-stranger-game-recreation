--- @class Tile representing unreachable wall
WallTile = Class { __includes = BaseTile }

function WallTile:render()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(.6, .3, .1, 1)
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, TILE_SIZE - 2, TILE_SIZE - 2)
end
