--- @class Goal of current level. Reaching this tile triggers the win condition.
GoalTile = Class { __includes = BaseTile }


function GoalTile:init(coordinates)
    self.coordinates = coordinates
    self.canBePicked = true
    self.type = 'GoalTile'
end

function GoalTile:render()
    local x = self.coordinates:inGameX()
    local y = self.coordinates:inGameY()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("line", x, y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle("fill", x + 1, y + 1, TILE_SIZE - 2, TILE_SIZE - 2)
end

--- Called whenever any entity enter the tile
function GoalTile:onEnter(entity, level)
    if entity.type == 'Player' then
        level:triggerWin()
    end
end

function GoalTile:canEnter(entity)
    return true
end
