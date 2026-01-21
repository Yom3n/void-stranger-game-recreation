Level = Class {}

function Level:init()
    self.tiles = {}
    for i = 1, LEVEL_WIDTH, 1 do
        self.tiles[i] = {}
        for j = 1, LEVEL_HEIGHT, 1 do
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
