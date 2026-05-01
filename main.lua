require 'src/deps'



function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    love.window.setTitle("Void stranger")

    Fonts = {
        small = love.graphics.newFont('assets/fonts/PixelifySans-Regular.ttf', 13, "normal"),
        regular = love.graphics.newFont('assets/fonts/PixelifySans-Regular.ttf', 16, "normal"),
        big = love.graphics.newFont('assets/fonts/PixelifySans-Regular.ttf', 24, "normal"),
    }
    love.graphics.setFont(Fonts.regular)

    Sprites = {
        characterSheet = love.graphics.newImage('assets/graphics/characterSpriteSheet.png')
    }
    --- CharacterSheet contains:
    --- 1st row - character in four directions
    --- 2nd row - tiles
    --- 3rd row - objects
    local quads = GenerateQuads(Sprites.characterSheet, 3)
    CharacterQuads = {
        charDown = quads[0][0],
        charUp = quads[0][1],
        charRight = quads[0][2],
        charLeft = quads[0][3],
    }
    TileQuads = {
        floor = quads[1][0],
        goal = quads[1][1]
    }
    ObjectsQuads = {
        egg = quads[2][0]
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    -- Way to globally access pressed key
    love.keyboard.keypressed = {}

    StateMachine = StateMachine {
        ["game"] = function() return GameState() end,
        ["gameOver"] = function() return GameOverState() end,
        ["win"] = function() return WinState() end
    }
    StateMachine:change("game")
end

function love.update(dt)
    StateMachine.current:update(dt)

    love.keyboard.keypressed = {}
end

function love.draw()
    push:start()

    StateMachine.current:render()
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
    love.graphics.setFont(Fonts.regular)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end
