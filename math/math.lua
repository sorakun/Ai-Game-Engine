
--[[
	Mathematical function that are used by the editor and can be used by the projects.

	http://math.stackexchange.com/questions/384186/calculate-new-positon-of-rectangle-corners-based-on-angle
]]

local AiMath = { }

function AiMath.rotatePoint(p, rot, ox, oy)
	return {
		x = ox + (p.x - ox) * math.cos(-rot) + (p.y - oy) * math.sin(-rot),
		y = oy - (p.x - ox) * math.sin(-rot) + (p.y - oy) * math.cos(-rot)
	}
end

-- Returns the rotated coordinates of a given object. 
function AiMath.rotateObject(o)
	local w, h = o:GetWidth(), o:GetHeight()
	local px, py = o:GetPos()
	local rpx, rpy = o:GetRealPos()
	local ox = px
	local oy = py

	local op1 = { x = rpx, y = rpy}
	local p1 = AiMath.rotatePoint(op1, o.rot, ox, oy)
		
	-- Original point 2 coordinates 
	local op2 = { x = rpx + w, y = rpy}
	local p2 = AiMath.rotatePoint(op2, o.rot, ox, oy)

	-- Original point 3 coordinates 
	local op3 = { x = rpx + w, y = rpy + h}
	local p3 = AiMath.rotatePoint(op3, o.rot, ox, oy)

	-- Original point 4 coordinates 
	local op4 = { x = rpx, y = rpy + h}
	local p4 = AiMath.rotatePoint(op4, o.rot, ox, oy)

	return p1, p2, p3, p4
end

-- Check if an object has been clicked.
function AiMath.objectClicked(obj, x, y)
	local w, h = obj:GetWidth(), obj:GetHeight()

	local p = {x = x, y = y}
	local x1, y1 = obj:GetPos()
	local x2, y2 = obj:GetRealPos()
	-- Rotate clicked position with -obj.rot
	local newP = AiMath.rotatePoint(p, -obj.rot, x1, y1)


	if newP.x > x2 and newP.x < x2 + w and newP.y > y2 and newP.y < y2 + h then
		return true
	end

	return false
end

return AiMath 