--[[
	2D Vectors
]]

local class = require("oop.middleclass")
local Vector = class("Vector")

function Vector:initialize(x, y)
	self.x = x
	self.y = y
end

function Vector:Fork()
	return Vector:new(self.x, self.y)
end

function Vector:IsZero()
	return self.x == 0 and self.y == 0
end

function Vector:Length()
	return math.sqrt(self.x^2 + self.y^2)
end

function Vector:Length2()
	return self.x^2 + self.y^2
end

function Vector:Distance(v)
	local dx = self.x - v.x
	local dy = v.y - v.y

	return math.sqrt(dx^2 + dy^2)
end

function Vector:Distance2(v)
	local dx = self.x - v.x
	local dy = v.y - v.y

	return dx^2 + dy^2
end

function Vector:Dot(v)
	return self.x * v.x + self.y * v.y
end

return Vector