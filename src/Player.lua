Player = Class {}

function Player:init(x, y)
    self.x = x
    self.y = y
end

function Player:render()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("fill", self.x + TILE_SIZE / 2, self.y + TILE_SIZE / 2, TILE_SIZE / 2)
end
