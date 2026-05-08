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



    local soundsData = {
        music = love.sound.newSoundData('assets/sounds/Music.wav'),
        actionBlocked = love.sound.newSoundData('assets/sounds/ActionBlocked.wav'),
        levelWarp = love.sound.newSoundData('assets/sounds/LevelWarp.wav'),
        pickUpTile = love.sound.newSoundData('assets/sounds/PickUpTile.wav'),
        placeTile = love.sound.newSoundData('assets/sounds/PlaceTile.wav'),
        pushObject = love.sound.newSoundData('assets/sounds/PushObj.wav'),
        step = love.sound.newSoundData('assets/sounds/Step.wav'),
        fall = love.sound.newSoundData('assets/sounds/Fall.wav'),
    }

    Sounds = {
        music = love.audio.newSource(soundsData.music),
        actionBlocked = love.audio.newSource(soundsData.actionBlocked),
        levelWarp = love.audio.newSource(soundsData.levelWarp),
        pickUpTile = love.audio.newSource(soundsData.pickUpTile),
        placeTile = love.audio.newSource(soundsData.placeTile),
        pushObject = love.audio.newSource(soundsData.pushObject),
        step = love.audio.newSource(soundsData.step),
        fall = love.audio.newSource(soundsData.fall),
    }
    Sounds.music:setLooping(true)
    love.audio.play(Sounds.music)

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
