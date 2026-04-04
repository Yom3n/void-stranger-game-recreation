-- Returns row of Tiles
function GenerateUiBar()
    local result = {
        UiBlankTile(Coordinates(1, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(2, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(3, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(4, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(5, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(6, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(7, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(8, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(9, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(10, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(11, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(12, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(13, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(14, LEVEL_HEIGHT)),
    }
    assert(#result == LEVEL_WIDTH)
    return result
end
