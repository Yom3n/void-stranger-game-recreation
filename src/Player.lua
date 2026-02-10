Player = Class {}

--- @param level table # The level object containing the map and tiles.
function Player:init(coordinates, level)
    assert(coordinates ~= nil, 'Coordinates is required')
    assert(level ~= nil, 'Level is required')
    self.coordinates = coordinates
    self.type = 'Player'
    --- number of tries uesr can fail without ending a game
    self.lives = 1
    self.level = level
    -- Direction the player is facing. Valid values: 'u', 'd', 'l', 'r' (same as move(dir)); reflects the last successful move.
    self.direction = 'l'
    -- Tile that is currently in VoidStaff. When it's not nil, player can place this tile on any VoidTile on the map
    self.voidStaffTile = nil
end

-- map direction to arrow - temporary solution for showing player direction before sprites implementation
local dirToArrow = {
    l = '<',
    r = '>',
    u = '^',
    d = 'v',
}

function Player:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("fill", x + TILE_SIZE / 2, y + TILE_SIZE / 2, TILE_SIZE / 2)
    love.graphics.setColor(1, 1, 1, 1)

    local arrow = dirToArrow[self.direction]
    if arrow == nil then
        error("Unsupported direction: " .. self.direction)
    end
    love.graphics.print(arrow, x + TILE_SIZE / 2 - 5, y + TILE_SIZE / 2 - 5)
end

--- Moves the player in the specified direction and updates their coordinates.
--- @param dir string # The direction to move the player ('u', 'd', 'l', 'r').
function Player:move(dir)
    assert(dir ~= nil, 'dir is required')
    assert(dir == 'u' or dir == 'd' or dir == 'l' or dir == 'r', 'unsupported dir: ' .. tostring(dir))
    local newPosition = self.coordinates:copy()
    if dir == 'u' then
        if self.coordinates.y == 1 then
            -- can't move outside of the screen
            return
        end
        newPosition.y = newPosition.y - 1
    elseif dir == 'd' then
        if self.coordinates.y == LEVEL_HEIGHT then
            -- can't move outside of the screen
            return
        end
        newPosition.y = newPosition.y + 1
    elseif dir == 'l' then
        if self.coordinates.x == 1 then
            -- can't move outside of the screen
            return
        end
        newPosition.x = newPosition.x - 1
    elseif dir == 'r' then
        if self.coordinates.x == LEVEL_WIDTH then
            -- can't move outside of the screen
            return
        end
        newPosition.x = newPosition.x + 1
    end

    local targetTile = self.level:peekTile(newPosition)
    if not targetTile:canEnter(self) then
        return
    end
    self.coordinates = newPosition
    self.direction = dir
    targetTile:onEnter(self, self.level)
end

--- When player inventory is empty and player is facing pickable tile then this tile
--- goes to Void Staff
function Player:pickUpTile()
    if self.voidStaffTile then
        -- TODO Play beep sound
        -- Inventory full, can't pick up another tile
        return
    end
    local targetCoords = self:getFacingTileCoordinates()
    if not targetCoords then
        return
    end
    -- Get tile before its replaced with void
    local target = self.level:peekTile(targetCoords)
    local success = self.level:replaceWithVoid(targetCoords)
    if success then
        assert(target.canBePicked)
        self.voidStaffTile = target
    else
        -- Play BEEP sound
        -- Player tries to pick up not pickable tile
    end
end

-- Places tile on the VoidTile that player is looking at
function Player:placeTile()
    if self.voidStaffTile == nil then
        -- TODO Play beep sound
        -- VoidStaff is empty
        -- print("VoidStaff is empty")
        return
    end
    assert(self.voidStaffTile.type ~= 'VoidTile', 'VoidTiles are not pickable, so never should be in the staff')
    local targetCoords = self:getFacingTileCoordinates()
    if not targetCoords then
        print("Invalid target coords. Can't place tile")
        return
    end
    self.voidStaffTile.coordinates = targetCoords
    local success = self.level:placeTile(self.voidStaffTile)
    if success then
        self.voidStaffTile = nil
    else
        -- Play BEEP sound
        -- Couldn't place tile on this spot
    end
end

-- Returns coordinates of the tile that player is looking at
-- Returns nil when trying reach out of level bounds
function Player:getFacingTileCoordinates()
    local targetCoords = self.coordinates:copy()
    if self.direction == 'l' then
        targetCoords.x = targetCoords.x - 1
    elseif self.direction == 'r' then
        targetCoords.x = targetCoords.x + 1
    elseif self.direction == 'u' then
        targetCoords.y = targetCoords.y - 1
    elseif self.direction == 'd' then
        targetCoords.y = targetCoords.y + 1
    end
    if not targetCoords:validate() then
        print(
            string.format(
                "Invalid target coordinates in getFacingTileCoordinates: x=%s, y=%s",
                tostring(targetCoords.x),
                tostring(targetCoords.y)
            )
        )
        return nil
    end
    return targetCoords
end

function Player:die()
    -- TODO We can can play some sound and animation
    self.lives = self.lives - 1
    self.level:restart()
end
