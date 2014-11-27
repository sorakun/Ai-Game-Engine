
local class = require("oop.middleclass")
local Object = require("object.object")

local UfoRotate = project.ImportControl("uforotation")

local Ufo = class('Ufo', Object)

function Ufo:initialize()
	Object.initialize(self, "ufo", Game.AssetManager:ImportSprite("ufo1"), 100, 100)
	self:AddControl(UfoRotate:new())
	self.ox = 45
	self.oy = 45
end

return Ufo