Egg = Class { __includes = BaseObject }

-- Egg is an object pushable by a Player. Can fall into void
function Egg:init(coordinates)
    -- @type Coordinates
    self.coordinates = coordinates
    self.type = 'Egg'
end

--- Renders the object onto the screen
function Egg:render()
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill",
        self.coordinates:inGameX() + TILE_SIZE / 2,
        self.coordinates:inGameY() + TILE_SIZE / 2,
        TILE_SIZE / 2)
end
