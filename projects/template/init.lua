Game = require("game.game")

project.name = "template"

Game.AssetManager = require("assetmanager.assetmanager"):new()

-- Registering sprites
Game.AssetManager:Register("player", "ships/player.png")
Game.AssetManager:Register("ufo1", "ships/ufo1.png")
Game.AssetManager:Register("ufo2", "ships/ufo2.png")
Game.AssetManager:Register("ufo3", "ships/ufo3.png")
Game.AssetManager:Register("ufo4", "ships/ufo4.png")

local spaceJunk = project.ImportScene("SpaceJunk"):new()

local o1 = project.ImportObject("ufo"):new()

spaceJunk:AddObject(o1)