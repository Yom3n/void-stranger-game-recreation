-- Instead of using width and height of the screen
-- this Coordinates let you operate on tiles cordinates.
-- x coordinate is a horizontal tile from 1 to LEVEL_WIDTH
-- y coordinate is a vertical tile from 1 to LEVEL_HEIGHT
Coordinates = Class {}

function Coordinates:init(x, y)
    assert(x >= 1 and x <= LEVEL_WIDTH, "x coordinate must be between 1 and LEVEL_WIDTH")
    assert(y >= 1 and y <= LEVEL_HEIGHT, "y coordinate must be between 1 and LEVEL_HEIGHT")
    self.x = x
    self.y = y
end

-- Returns X of top left corner of a tile
function Coordinates:inGameX()
    return (self.x - 1) * TILE_SIZE
end

-- Returns Y of top left corner of a tile
function Coordinates:inGameY()
    return (self.y - 1) * TILE_SIZE
end

-- Creates and returns a new Coordinates object with the same x and y values
function Coordinates:copy()
    return Coordinates(self.x, self.y)
end

-- validates if coordinates are not out of bounds
function Coordinates:validate()
    return self.x >= 1 and self.x <= LEVEL_WIDTH and self.y >= 1 and self.y <= LEVEL_HEIGHT
end
