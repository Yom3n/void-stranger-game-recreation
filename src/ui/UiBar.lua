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

-- TODO NOW THESE TILES COORDINEATES ARE NOT UPDATED WHEN THEAY ARE CHAGNED ON THE LEVEL
-- TILES MUST BE A GETTER, AND THE ALL THE OPERATIONS MUST BE DONE ON THE LEVEL
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

local function getTileValue(tiles, index)
    assert(tiles ~= nil)
    assert(index ~= nil)
    local tile = tiles[index]
    -- accessed through . because its a field that is a Function type
    -- Don't check the type - there might be void tile, or Floor tile
    -- but then we want it to return nil
    return tile.getValue()
end
--- When player changes values on UI,
--- then this reads current UI bar values - not the one from GameState
--- Can return nil
function UiBar:getUiHp()
    return getTileValue(self.tiles, 3)
end

function UiBar:getUiLives()
    return getTileValue(self.tiles, 6)
end

function UiBar:getUiLevelIndex()
    return getTileValue(self.tiles, 14)
end
