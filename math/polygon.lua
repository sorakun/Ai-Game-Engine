--[[
	Convex Polygon class
]]

local class = require("oop.middleclass")
local Polygon = class("Polygon")

-- Constructor parameters are 2D Vectors
function Polygon:initialize(points)
	self.points = {}
	for i, v in ipairs(points) do
		table.insert(self.points, v)
	end
end

function Polygon:Print()
	for i, v in ipairs(self.points) do
		print("Points "..i.." : { "..v[1]..", "..v[2].."}")
	end
end

return Polygon