GameState = Class { __includes = BaseState }


function GameState:init()
    self.levelIndex = 1
    self:loadLevel(self.levelIndex)
end

function GameState:render()
    self.level:render()
end

function GameState:update(dt)
    if love.keyboard.keypressed['w'] then
        self.player:move('u')
    elseif love.keyboard.keypressed['s'] then
        self.player:move('d')
    elseif love.keyboard.keypressed['d'] then
        self.player:move('r')
    elseif love.keyboard.keypressed['a'] then
        self.player:move('l')
    end

    if love.keyboard.keypressed['j'] then
        self.player:pickUpTile()
    end
    if love.keyboard.keypressed['k'] then
        self.player:placeTile()
    end

end

-- levelIndex is a number starting from 1
function GameState:loadLevel(levelIndex)
    local levelBp = Levels[levelIndex]
    if levelBp == nil then
        StateMachine:change("win")
        return
    end
    self.level = Level(levelBp, {
        onGoalReached = function()
            self:loadNextLevel()
        end
    })
    self.player = self.level:getPlayer()
    self.levelIndex = levelIndex
    assert(self.player ~= nil, 'Player must exist on the level')
end

function GameState:loadNextLevel()
    self.levelIndex = self.levelIndex + 1
    self:loadLevel(self.levelIndex)
end
