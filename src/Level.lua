Level = Class {}

--- Maps blueprint symbols to tiles
local tilesBlueprintMapping = {
    w = WallTile,
    f = FloorTile,
    v = VoidTile,
}

-- Maps all characters/enemies or objects that are on the map
local objectsBlueprintMapping = {
    P = Player
}

function Level:init()
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
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',  'w', 'w', 'w', 'w', 'w', 'w', },
    }
    assert(#levelBlueprint == LEVEL_HEIGHT, "Invalid blueprint")
    assert(#levelBlueprint[1] == LEVEL_WIDTH, "Invalid blueprint")
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
                self.objects[i][j] = Object(Coordinates(i, j))
            end
        end
    end
end

function Level:render()
    for i = 1, LEVEL_WIDTH do
        for j = 1, LEVEL_HEIGHT do
            self.tiles[i][j]:render()
            if self.objects[i][j] ~= nil then
                self.objects[i][j]:render()
            end
        end
    end
end

-- Provide coordinates to get the tile of the level
function Level:peek(coordinates)
    return self.tiles[coordinates.x][coordinates.y]
end
