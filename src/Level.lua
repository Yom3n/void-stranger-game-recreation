Level = Class {}

local levelBlueprintMapping = {
    w = WallTile,
    f = FloorTile,
    v = VoidTile
}

function Level:init()
    -- Human readable map that let us simply draw levels. Symbols based on levelBlueprintMapping
    local levelBlueprint = {
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', },
    }
    assert(#levelBlueprint == LEVEL_HEIGHT, "Invalid blueprint")
    assert(#levelBlueprint[1] == LEVEL_WIDTH, "Invalid blueprint")
    self.tiles = {}
    for i = 1, LEVEL_WIDTH, 1 do
        self.tiles[i] = {}
        for j = 1, LEVEL_HEIGHT, 1 do
            -- In lua tables use [row][column] annotation,
            -- but I'm flipping it to make it blueprint more human readable
            local bpValue = levelBlueprint[j][i]
            -- print(i .. " " .. j, " " .. " " .. bpValue)
            local Tile = levelBlueprintMapping[bpValue]
            if Tile == nil then
                error(
                    bpValue ..
                    [[ is unsupported levelBlueprint value.
                    Check levelBlueprintMapping for correct values]]
                )
            end
            self.tiles[i][j] = Tile((i - 1) * TILE_SIZE, (j - 1) * TILE_SIZE)
        end
    end
end

function Level:render()
    for i = 1, LEVEL_WIDTH, 1 do
        for j = 1, LEVEL_HEIGHT, 1 do
            self.tiles[i][j]:render()
        end
    end
end
