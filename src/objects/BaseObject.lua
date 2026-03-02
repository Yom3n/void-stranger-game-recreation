BaseObject = Class {}

-- Servers as any object that can be placed on tiles - including Payer and Enemies
function BaseObject:init(coordinates)
    -- @type Coordinates
    self.coordinates = coordinates
    self.type = 'BaseTile'
end

--- Renders the object onto the screen
function BaseObject:render()
end
