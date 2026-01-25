--- @class BaseTile
--- Represents a single tile in the game.
--- @field x number The x-coordinate of the tile.
--- @field y number The y-coordinate of the tile.
BaseTile = Class {}

--- Creates a new Tile.
--- @param x number The x-coordinate.
--- @param y number The y-coordinate.
function BaseTile:init(x, y)
    self.x = x
    self.y = y
end

--- Renders the tile onto the screen
function BaseTile:render()
end
