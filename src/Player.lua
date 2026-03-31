Player = Class { __includes = BaseObject }

--- @param level table # The level object containing the map and tiles.
function Player:init(coordinates, level)
    assert(coordinates ~= nil, 'Coordinates is required')
    assert(level ~= nil, 'Level is required')
    self.coordinates = coordinates
    self.type = 'Player'
    self.level = level
    -- Direction the player is facing. Valid values: 'u', 'd', 'l', 'r' (same as move(dir)); reflects the last successful move.
    self.direction = 'l'
    -- Tile that is currently in VoidStaff. When it's not nil, player can place this tile on any VoidTile on the map
    self.voidStaffTile = nil
end

-- maps direction to CharacterQuads field name
local dirToQuadField = {
    l = "charLeft",
    r = "charRight",
    u = "charUp",
    d = "charDown",
}

-- maps player direction to character sprite quad
local function dirToQuad(dir)
    if CharacterQuads == nil then
        return
    end
    local quadField = dirToQuadField[dir]
    if quadField == nil then
        error('Invalid direction: ' .. tostring(dir))
    end
    return CharacterQuads[quadField]
end

function Player:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    if CharacterQuads == nil then
        print("CharacterQuads not yet instantiated. Can not render Player")
        return
    end
    local quad = dirToQuad(self.direction)
    if quad == nil then
        print("Unsupported player direction for rendering: " .. tostring(self.direction))
        return
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Sprites.characterSheet, quad, x, y)
end

--- Moves the player in the specified direction and updates their coordinates.
--- @param dir string # The direction to move the player ('u', 'd', 'l', 'r').
function Player:move(dir)
    assert(dir ~= nil, 'dir is required')
    local newPosition = self.coordinates:nextToTile(dir)
    if newPosition == nil then
        -- Tries to move outside boundaries
        return
    end
    local moved = self.level:tryMoveObject(self, newPosition, dir, {
        canPush = true
    })
    if moved then
        self.coordinates = newPosition
        self.direction = dir
        -- TODO I don't like that player need to call targetTile:onEnter by itself
        local targetTile = self.level:peekTile(newPosition)
        targetTile:onEnter(self, self.level)
    end
    return moved
end

--- When player inventory is empty and player is facing pickable tile then this tile
--- goes to Void Staff
function Player:pickUpTile()
    if self.voidStaffTile then
        -- TODO Play beep sound
        -- Inventory full, can't pick up another tile
        return
    end
    local targetCoords = self.coordinates:nextToTile(self.direction)
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
    local targetCoords = self.coordinates:nextToTile(self.direction)
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

function Player:die()
    -- TODO We can can play some sound and animation
    self.level:onPlayerDeath()
end
