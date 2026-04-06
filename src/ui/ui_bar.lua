-- Returns row of Tiles
function GenerateUiBar()
    local result = {
        UiBlankTile(Coordinates(1, LEVEL_HEIGHT)),
        UiHpIconTile(Coordinates(2, LEVEL_HEIGHT)),
        -- num hp
        UiValueTile(Coordinates(3, LEVEL_HEIGHT), "07"),
        UiBlankTile(Coordinates(4, LEVEL_HEIGHT)),
        -- locust icon
        UiBlankTile(Coordinates(5, LEVEL_HEIGHT)),
        -- num lives
        UiValueTile(Coordinates(6, LEVEL_HEIGHT), "03"),
        UiBlankTile(Coordinates(7, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(8, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(9, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(10, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(11, LEVEL_HEIGHT)),
        UiBlankTile(Coordinates(12, LEVEL_HEIGHT)),
        UiValueTile(Coordinates(13, LEVEL_HEIGHT), "B0"),
        -- level number
        UiValueTile(Coordinates(14, LEVEL_HEIGHT), "01"),
    }
    assert(#result == LEVEL_WIDTH)
    return result
end
