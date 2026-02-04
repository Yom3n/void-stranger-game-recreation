WinState = Class { __includes = BaseState }

function WinState:init() end

function WinState:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("You won!", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
    love.graphics.printf("Press SPACE to restart", 0, VIRTUAL_HEIGHT / 2 + 30, VIRTUAL_WIDTH, "center")
end

function WinState:update(dt)
    if love.keyboard.keypressed['space'] then
        StateMachine:change("game")
    end
end

