GameState = Class { __includes = BaseState }

function GameState:init()
    self.levelIndex = 1
    self.playerLives = INIT_PLAYER_LIVES
    self.playerHp = INIT_PLAYER_HP
    self:changeLevel(self.levelIndex, self.playerLives, self.playerHp)
end

function GameState:render()
    if self.level == nil then
        return
    end
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
function GameState:changeLevel(levelIndex, playerLives, playerHp)
    self.levelIndex = levelIndex

    -- When level changes, we need to take values from UI and update Player state based on them
    if playerHp == nil or playerHp <= 0
        or playerLives == nil or playerLives <= 0 then
        self:onPlayerDeath()
        return
    end
    self.playerLives = playerLives
    self.playerHp = playerHp


    local levelBp = Levels[levelIndex]
    if levelBp == nil then
        StateMachine:change("win")
        return
    end
    self.level = Level(levelIndex, levelBp, {
        onWarpTriggered = function(playerLives, playerHp, levelIndex)
            print("MOVING PLAYER TO: ".. levelIndex)
            self:changeLevel(levelIndex, playerLives, playerHp )
        end,
        onGoalReached = function(playerLives, playerHp)
            self:loadNextLevel(playerLives, playerHp)
        end,
        onPlayerDeath = function()
            self:onPlayerDeath()
        end
    })
    self.player = self.level:getPlayer()
    assert(self.player ~= nil, 'Player must exist on the level')
end

function GameState:onPlayerDeath()
    self.playerLives = self.playerLives - 1
    if self.playerLives <= 0 then
        StateMachine:change("gameOver")
        return
    end
    self.playerHp = INIT_PLAYER_HP
    self:changeLevel(self.levelIndex, self.playerLives, self.playerHp)
end

function GameState:loadNextLevel(playerLives, playerHp)
    self:changeLevel(self.levelIndex + 1, playerLives, playerHp)
end
