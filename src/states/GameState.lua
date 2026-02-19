GameState = Class { __includes = BaseState }

function GameState:init()
    -- Human readable map that lets us simply draw levels.
    -- First symbol is always a Floor type based on tilesBlueprintMapping
    -- Second symbol is optional and represents character or object on the tile (usually on Floor tiles).
    -- Mapping of second symbol is based on objectsBlueprintMapping
    local levelBlueprint = {
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',  'w', 'w', 'w', 'w', 'w', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'fP', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'G', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',  'w', 'w', 'w', 'w', 'w', 'w', },
    }

    self.level = Level(levelBlueprint)
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
