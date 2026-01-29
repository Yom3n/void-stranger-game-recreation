--- @class BaseTile
--- Represents a single tile in the game.
--- @pfiels coordinates Coordinates The position of the tile
BaseTile = Class {}

--- Creates a new Tile.
--- @param coordinates Coordinates The position of the tile
function BaseTile:init(coordinates)
    -- @type Coordinates
    self.coordinates = coordinates
end

--- Renders the tile onto the screen
function BaseTile:render()
end
