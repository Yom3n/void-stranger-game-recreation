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
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill",
        self.coordinates:inGameX() + TILE_SIZE / 2,
        self.coordinates:inGameY() + TILE_SIZE / 2,
        TILE_SIZE / 2)
end

--- Eggs can be pushed, but can't move through Walls, and other objects
---  that user can't enter (for example already occupied tiles)
function Egg:move(dir)
    local targetCoordinates = self.coordinates:nextToTile(dir)
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

--- Chekc if Player cna push the object
function Egg:canBePushed(dir)
    local targetCoordinates = self.coordinates:nextToTile(dir)
    local targetTile = self.level:peekTile(targetCoordinates)
    local targetObject = self.level:peekObject(targetCoordinates)
    if targetObject ~= nil then
        return false
    end
    return targetTile:canEnter()
end
