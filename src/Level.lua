Level = Class {}

--- Maps blueprint symbols to tiles
local tilesBlueprintMapping = {
    w = WallTile,
    f = FloorTile,
    v = VoidTile,
    G = GoalTile
}

-- Maps all characters/enemies or objects that are on the map
local objectsBlueprintMapping = {
    P = Player
}

--- Initializes a Level instance with a blueprint structure.
---
--- The levelBlueprint is a 2D table where each cell contains a string representing
--- a tile type and optionally an object on that tile.
---
---
--- The blueprint is indexed as [row][column] and must match LEVEL_HEIGHT and LEVEL_WIDTH.
---
--- @param levelBlueprint table A 2D table representing the level layout
function Level:init(levelBlueprint)
    assert(
        #levelBlueprint == LEVEL_HEIGHT,
        string.format(
            "Invalid blueprint: expected height of %d, got %d",
            LEVEL_HEIGHT,
            #levelBlueprint
        )
    )
    assert(
        #levelBlueprint[1] == LEVEL_WIDTH,
        string.format(
            "Invalid blueprint: expected width of %d, got %d",
            LEVEL_WIDTH,
            #levelBlueprint[1]
        )
    )
    self.tiles = {}
    self.objects = {}
    for i = 1, LEVEL_WIDTH do
        self.tiles[i] = {}
        self.objects[i] = {}
        for j = 1, LEVEL_HEIGHT do
            -- In lua tables use [row][column] annotation,
            -- but I'm flipping it to make it blueprint more human readable
            local bpValue = levelBlueprint[j][i]
            local valueLength = string.len(bpValue)

            if valueLength > 2 then
                error(bpValue .. "is invalid blueprint value")
            end

            local bpTileValue = string.sub(bpValue, 1, 1)
            -- print(i .. " " .. j, " " .. " " .. bpValue)
            local Tile = tilesBlueprintMapping[bpTileValue]
            if Tile == nil then
                error(
                    bpTileValue ..
                    [[ is unsupported tile value.
                    Check tilesBlueprintMapping for correct values]]
                )
            end
            self.tiles[i][j] = Tile(Coordinates(i, j))

            if valueLength == 2 then
                local objVal = string.sub(bpValue, 2, 2)
                local Object = objectsBlueprintMapping[objVal]
                if Object == nil then
                    error(
                        objVal ..
                        [[ is unsupported level object value.
                    Check objectsBlueprintMapping for correct values]]
                    )
                end
                self.objects[i][j] = Object(Coordinates(i, j), self)
            end
        end
    end
end

-- Called when player reaches the GoalTile
function Level:triggerWin()
    StateMachine:change("win")
end

function Level:restart()
    StateMachine:change("game")
end

--- Replaces the tile at the specified coordinates with a `VoidTile`.
-- Checks if the tile can be picked and if there are no objects on it before replacing.
-- @param coordinates table A table containing `x` and `y` fields specifying the tile's position.
-- @return boolean `true` if the tile was successfully replaced, `false` otherwise.
function Level:replaceWithVoid(coordinates)
    assert(coordinates ~= nil)
    local target = self.tiles[coordinates.x][coordinates.y]
    if not target.canBePicked then
        return false
    end
    if self.objects[coordinates.x][coordinates.y] ~= nil then
        -- Can't remove tile when there is object on it
        return false
    end
    self.tiles[coordinates.x][coordinates.y] = VoidTile(coordinates)
    return true
end

--- Replaces existing VoidTile with new tile
--- Only VoidTiles can be replaced
function Level:placeTile(tile)
    assert(tile)
    assert(tile.type ~= 'VoidTile')
    local coordinates = tile.coordinates
    local target = self.tiles[coordinates.x][coordinates.y]
    if target.type ~= 'VoidTile' then
        print('Tiles can be placed only on VoidTiles')
        return false
    end
    if self.objects[coordinates.x][coordinates.y] ~= nil then
        -- Can't place tile when there is an object on this tile
        return false
    end
    self.tiles[coordinates.x][coordinates.y] = tile
    -- print(string.format("Succesfully placed tile %s on %s, %s", tile.type, coordinates.x, coordinates.y))
    return true
end

function Level:render()
    -- Don't merge these two loops.
    -- Causes issues with order of rendering when objects start moving on the map
    for i = 1, LEVEL_WIDTH do
        for j = 1, LEVEL_HEIGHT do
            self.tiles[i][j]:render()
        end
    end
    for i = 1, LEVEL_WIDTH do
        for j = 1, LEVEL_HEIGHT do
            if self.objects[i][j] ~= nil then
                self.objects[i][j]:render()
            end
        end
    end
end

-- Provide coordinates to get the tile of the level
function Level:peekTile(coordinates)
    assert(coordinates ~= nil, 'Coordinates can\'t be nil')
    return self.tiles[coordinates.x][coordinates.y]
end

function Level:getPlayer()
    for i = 1, LEVEL_WIDTH do
        for j = 1, LEVEL_HEIGHT do
            local obj = self.objects[i][j]
            if obj ~= nil and obj.type == 'Player' then
                return obj
            end
        end
    end
    error('Player not spawned on the level')
end
