-- Human readable map that lets us simply draw levels.
-- First symbol is always a Floor type based on tilesBlueprintMapping
-- Second symbol is optional and represents character or object on the tile (usually on Floor tiles).
-- Mapping of second symbol is based on objectsBlueprintMapping
Levels = {
    [1] = {
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',  'w', 'w', 'w', 'w', 'w', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'v', 'v', 'v', 'v', 'v', 'v', 'v',  'v', 'v', 'v', 'v', 'v', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'fP', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'G', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'f', 'f', 'v', 'f', 'f', 'f',  'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w',  'w', 'w', 'w', 'w', 'w', 'w', },
    },
    [2] = {
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', },
        { 'w', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'w', 'w', 'w', 'f', 'w', 'w', },
        { 'w', 'f', 'f', 'f', 'f', 'w', 'w', 'f', 'w', 'w', 'f', 'f', 'f', 'w', },
        { 'w', 'f', 'G', 'f', 'f', 'w', 'w', 'f', 'f', 'f', 'f', 'f', 'f', 'w', },
        { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'f', 'w', 'w', 'f', 'f', 'f', 'w', },
        { 'v', 'w', 'w', 'w', 'w', 'w', 'w', 'f', 'w', 'w', 'f', 'f', 'f', 'w', },
        { 'v', 'w', 'fP', 'f', 'f', 'f', 'f', 'f', 'w', 'w', 'w', 'w', 'w', 'w', },
        { 'v', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'v', 'v', 'v', 'v', 'v', },
    }
}
