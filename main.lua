require 'src/deps'


function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    love.window.setTitle("Void stranger")

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    -- Way to globally access pressed key
    love.keyboard.keypressed = {}

    gameState = GameState()
end

function love.update(dt)
    gameState:update(dt)
    
    love.keyboard.keypressed = {}
end

function love.draw()
    push:start()

    gameState:render()
    displayFPS()

    push:finish()
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keypressed[key] = true
end

-- Extension on keyboard that let us globally check if keyboard was pressed
function love.keyboard.wasPressed(key)
    return love.keyboard.keypressed[key]
end

function displayFPS()
    -- simple FPS display across all states
    -- love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end
