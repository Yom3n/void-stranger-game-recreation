GameOverState = Class { __includes = BaseState }

function GameOverState:init() end

function GameOverState:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Game Over", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
    love.graphics.printf("Press SPACE to restart", 0, VIRTUAL_HEIGHT / 2 + 30, VIRTUAL_WIDTH, "center")
end

function GameOverState:update(dt)
    if love.keyboard.keypressed['space'] then
        StateMachine:change("game")
    end
end

function GameOverState:enter(params) end

function GameOverState:exit() end
