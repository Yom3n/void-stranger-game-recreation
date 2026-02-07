--- @class BaseTile
--- Represents a single tile in the game.
--- @pfiels coordinates Coordinates The position of the tile
BaseTile = Class {}

--- Creates a new Tile.
--- @param coordinates Coordinates The position of the tile
function BaseTile:init(coordinates)
    -- @type Coordinates
    self.coordinates = coordinates
    self.type = 'BaseTile'
    --- When true player can take the tile, and place it in another place
    self.canBePicked = true
end

--- Renders the tile onto the screen
function BaseTile:render()
end

--- Called whenever any entity enter the tile
function BaseTile:onEnter(entity, level)
end

--- Determines whether the given entity is allowed to enter this tile.
--- @param entity any The entity attempting to enter the tile
--- @return boolean canEnter True if the entity is allowed to enter, false otherwise
function BaseTile:canEnter(entity)
    return true
end
