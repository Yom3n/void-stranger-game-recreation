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

--- Moves the player in the specified direction and updates their coordinates.
--- @param dir string # The direction to move the player ('u', 'd', 'l', 'r').
--- @param level table # The level object containing the map and tiles.
--- @return table coordinates # The new coordinates of the player after the move.
function Player:move(dir, level)
    if dir == 'u' then
        if self.coordinates.y == 1 then
            -- can't move below 1
            return self.coordinates
        end
        local newPosition = self.coordinates:copy()
        newPosition.y = newPosition.y - 1
        local targetTile = level:peekTile(newPosition)
        if targetTile.type == 'WallTile' then
            -- can't move into wall
            -- TODO Play sound when bumping into a wall
            return self.coordinates
        end
        self.coordinates = newPosition
        return newPosition
    end
end
