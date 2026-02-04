-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'lib.push'

-- the "Class" library we're using will allow us to represent anything in
-- our game as code, rather than keeping track of many disparate variables and
-- methods
--
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib.class'

require 'lib.StateMachine'


-- Contains all constants
require 'src.constants'

-- Encapsulates in game x and y to be able to do calculations
-- based on Tiles, rather than VIRTUAL_WIDTH and VIRTUAL_HEIGHT
require 'src.Coordinates'

-- Represents single tile on the level
require 'src.tiles.BaseTile'
require 'src.tiles.FloorTile'
require 'src.tiles.WallTile'
require 'src.tiles.VoidTile'

-- Playable character
require 'src.Player'

-- Groups tiles into a level
require 'src.Level'


-- States
require 'src.states.BaseState'
require 'src.states.GameState'
require 'src.states.GameOverState'