Player = Class {}

function Player:init(coordinates)
    self.coordinates = coordinates
    self.type = 'Player'
end

function Player:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("fill", x + TILE_SIZE / 2, y + TILE_SIZE / 2, TILE_SIZE / 2)
end

function Player:move(dir, level)
    -- TODO
    error("Not implemented")
    if dir == 'up' then
        
    end

end