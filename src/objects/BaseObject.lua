BaseObject = Class {}

-- Serves as any object that can be placed on tiles - including Player and Enemies
function BaseObject:init(coordinates)
    -- @type Coordinates
    self.coordinates = coordinates
    self.type = 'BaseObject'
end

--- Renders the object onto the screen
function BaseObject:render()
end

-- Removes object from level
function BaseObject:die()
end

--- Check if Player can push the object in provided direction
--- Returns bool
function BaseObject:canBePushed(dir)
    return false
end
