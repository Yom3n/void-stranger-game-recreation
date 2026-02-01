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
function Player:move(dir, level)
    assert(dir ~= nil, 'dir is requered')
    assert(level ~= nil, 'Level is required')

    local newPosition = self.coordinates:copy()
    if dir == 'u' then
        if self.coordinates.y == 1 then
            -- can't move outside of the screen
            return
        end
        newPosition.y = newPosition.y - 1
    end
    if dir == 'd' then
        if self.coordinates.y == LEVEL_HEIGHT then
            -- can't move outside of the screen
            return
        end
        newPosition.y = newPosition.y + 1
    end
    if dir == 'l' then
        if self.coordinates.x == 1 then
            -- can't move outside of the screen
            return
        end
        newPosition.x = newPosition.x - 1
    end
    if dir == 'r' then
        if self.coordinates.x == LEVEL_WIDTH then
            -- can't move outside of the screen
            return
        end
        newPosition.x = newPosition.x + 1
    end

    local targetTile = level:peekTile(newPosition)
    if targetTile.type == 'WallTile' then
        -- can't move into wall
        -- TODO Play sound when bumping into a wall
        return
    end
    self.coordinates = newPosition
end
