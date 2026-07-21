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
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Sprites.characterSheet, TileQuads.goal, x, y)
end

--- Called whenever any entity enter the tile
function GoalTile:onEnter(entity, level)
    if entity.type == 'Player' then
        level:onGoalReached()
    end
end

function GoalTile:canEnter(entity)
    return true
end
