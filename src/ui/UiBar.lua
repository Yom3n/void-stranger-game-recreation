-- Returns row of Tiles
UiBar = Class {}

function UiBar:getPlayerHp()
    return self.stateMachine.current.playerHp
end

function UiBar:getPlayerLives()
    return self.stateMachine.current.playerLives
end

function UiBar:getLevelIndex()
    return self.stateMachine.current.levelIndex
end

function UiBar:init(stateMachine)
    assert(stateMachine ~= nil)
    self.stateMachine = stateMachine
    self.tiles = {
        UiBlankTile(Coordinates(1, LEVEL_HEIGHT)),
        UiHpIconTile(Coordinates(2, LEVEL_HEIGHT)),
        -- num hp
        UiValueTile(Coordinates(3, LEVEL_HEIGHT),
            function() return self:getPlayerHp() end
        ),
        UiBlankTile(Coordinates(4, LEVEL_HEIGHT)),
        -- locust icon
        UiBlankTile(Coordinates(5, LEVEL_HEIGHT)),
        -- num lives
        UiValueTile(Coordinates(6, LEVEL_HEIGHT),
            function() return self:getPlayerLives() end
        ),
        UiBlankTile(Coordinates(7, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(8, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(9, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(10, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(11, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(12, LEVEL_HEIGHT)),
        UiValueTile(Coordinates(13, LEVEL_HEIGHT),
            function() return "B0" end
        ),
        -- level number
        UiValueTile(Coordinates(14, LEVEL_HEIGHT),
            function() return self:getLevelIndex() end
        ),
    }
    assert(#self.tiles == LEVEL_WIDTH)
end

function UiBar:render()
    for i = 1, LEVEL_WIDTH do
        self.tiles[i]:render()
    end
end
