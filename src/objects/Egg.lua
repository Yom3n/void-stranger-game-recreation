Egg = Class { __includes = BaseObject }

-- Egg is an object pushable by a Player. Can fall into void
function Egg:init(coordinates, level)
    assert(coordinates ~= nil, 'Coordinates must be provided')
    assert(level ~= nil, 'Level must be provided')
    -- @type Coordinates
    self.coordinates = coordinates
    self.type = 'Egg'
    self.level = level
end

--- Renders the object onto the screen
function Egg:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Sprites.characterSheet, ObjectsQuads.egg, x, y)
end

--- Eggs can be pushed, but can't move through Walls, and other objects
---  that user can't enter (for example already occupied tiles)
function Egg:move(dir)
    assert(dir ~= nil, 'dir is required')
    local targetCoordinates = self.coordinates:nextToTile(dir)
    if targetCoordinates == nil then
        return false
    end
    local moved = self.level:tryMoveObject(self, targetCoordinates, dir, {
        canPush = false,
    })
    if moved then
        self.coordinates = targetCoordinates
        local targetTile = self.level:peekTile(targetCoordinates)
        targetTile:onEnter(self, self.level)
    end
    return moved
end

function Egg:die()
    -- TODO Play falling animation
    self.level:removeObject(self.coordinates)
end

--- Checks if Player can push the object
function Egg:canBePushed(dir)
    assert(dir ~= nil)
    local targetCoordinates = self.coordinates:nextToTile(dir)
    if targetCoordinates == nil then
        return false
    end
    local targetTile = self.level:peekTile(targetCoordinates)
    local targetObject = self.level:peekObject(targetCoordinates)
    if targetObject ~= nil then
        return false
    end
    return targetTile:canEnter(self)
end
