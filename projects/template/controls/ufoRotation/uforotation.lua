
local class = require("oop.middleclass")
local Control = require("control.control")

local UfoRotation = class('UfoRotation', Control)

function UfoRotation:initialize()
	Control.initialize(self, "ufoRotate", true)
	self.updateFunc = function(self, dt)
		self.parent.rot = self.parent.rot + 0.04
	end
end

return UfoRotation