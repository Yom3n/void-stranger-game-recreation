GameState = Class { __includes = BaseState }

function GameState:init()
    self.level = Level()
    self.player = self.level:getPlayer()
    assert(self.player ~= nil, 'Player must exist on the level')
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


    if self.player.lives <= 0 then
        StateMachine:change("gameOver")
    end
end
