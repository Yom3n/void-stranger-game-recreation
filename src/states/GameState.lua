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
        self.player:move('u', self.level)
    elseif love.keyboard.keypressed['s'] then
        self.player:move('d', self.level)
    elseif love.keyboard.keypressed['d'] then
        self.player:move('r', self.level)
    elseif love.keyboard.keypressed['a'] then
        self.player:move('l', self.level)
    end

    if love.keyboard.keypressed['j'] then
        self.player:pickUpTile()
    end
    if love.keyboard.keypressed['k'] then
        self.player:placeTile()
    end


    if self.player.lives <= 0 then
        StateMachine:change("gameOver")
    end
end

-- levelIndex is a number starting from 1
function GameState:loadLevel(levelIndex)
    local levelBp = Levels[levelIndex]
    assert(levelBp ~= nil, 'Level ' .. tostring(levelIndex) .. ' does not exist')
    self.level = Level(levelBp)
    self.player = self.level:getPlayer()
    assert(self.player ~= nil, 'Player must exist on the level')
end
