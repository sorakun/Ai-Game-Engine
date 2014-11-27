

local class = require("oop.middleclass")
local Scene = require("scene.scene")

local SpaceJunk = class("Space Junk", Scene)

function SpaceJunk:initialize()
	Scene.initialize(self, "Spacejunk", 2000, 2000)
end

return SpaceJunk