--- @class Tile
--- Represents a single tile in the game.
--- @field x number The x-coordinate of the tile.
--- @field y number The y-coordinate of the tile.
Tile = Class {}

--- Creates a new Tile.
--- @param x number The x-coordinate.
--- @param y number The y-coordinate.
function Tile:init(x, y)
    self.x = x
    self.y = y
end

--- Renders the tile.
function Tile:render()
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("line", self.x, self.y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("fill", self.x + 2, self.y + 2, TILE_SIZE - 2, TILE_SIZE - 2)
end
