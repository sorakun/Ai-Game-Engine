--[[
	Modular and dynamic Object class that can have multiple
	Object childs, and user specified animations and updates.
	A Game object can be a player, NPC or even a GUI.
	Physics
]]

local class = require "oop.middleclass"

local utils = require("utilities.utils")

local Object = class("Object")


function Object:initialize(nameId, ImgObj, x, y)
	Engine.debug("Creating object \"".. nameId .."\"")
	-- Default values

	self.name = nameId
	self.childs = {}
	self.visible = true

	-- Coordinates in parent
	self.x = x
	self.y = y
	-- Scale
	self.sx = 1
	self.sy = 1
	-- Rotation
	self.rot = 0

	-- Center
	self.px = 0
	self.py = 0

	-- Offset
	self.ox = 0
	self.oy = 0

	-- Layer: Object is lower layer are drawn on the top.
	self.layer = 1

	-- Controller
	self.controls = { }

	-- Object's distance from camera, default value 100 
	self.distance = 100

	-- END OF DEFAULTS

	-- Animation control
	self.Animate = nil

	--[[ A very minimal drawable object. If it's nil, nothing to draw. 
	Every animation should assign current image object to this field. ]]
	self.drawable = ImgObj

	--[[ This drawable object concerns invisible objects, how they will be displayed in the editor,
	for example a spawn point. ]]
	self.engineSprite = nil

	-- Image color filter
	self.colorFilter = { r = 255, g = 255, b = 255, a = 255 }

	-- Physics
	self.physics = {}


	-- Static objects belongs to the scene.
	self.isStatic = false;

	if Engine.editingMode then
		-- Required by the Engine.
		self.__selectionX = 0
		self.__selectionY = 0
		self.__updateObject = true
	end
end

function Object:SaveDefaults(scene)
	local o1 = {
		visible = self.visible,
		x = self.x,
		y = self.y, 
		-- Scale
		sx = self.sx,
		sy = self.sy,
		-- Rotation
		rot = self.rot,

		-- Center
		px = self.px,
		py = self.py,

		-- Offset
		ox = self.ox,
		oy = self.oy,

		-- Layer: Object is lower layer are drawn on the top.
		layer = self.layer,

		-- Object's distance from camera, default value 100 
		distance = self.distance
	}

	table.save(o1, "projects/"..project.name.."/objects/"..self.name.."/defaults."..scene.name..".table")
end

function Object:LoadDefaults(scene)
	local o1 = table.load("projects/"..project.name.."/objects/"..self.name.."/defaults."..scene.name..".table")
	if o1 == nil then 
		return 
	end

	self.visible = o1.visible

	self.x = o1.x
	self.y = o1.y 
	
	self.sx = o1.sx
	self.sy = o1.sy

	self.rot = o1.rot

	self.px = o1.px
	self.py = o1.py

	self.ox = o1.ox
	self.oy = o1.oy

	self.layer = o1.layer

	self.distance = o1.distance
end

function Object:AttachUpdateEvent(evt)
	self.DoUpdate = evt
end

function Object:AttachChild(O)
	table.insert(self.childs, O)
	Engine.debug("Attaching "..O.name.." to "..self.name)
end

function Object:RemoveChild(O)
	table.remove(self.childs, O)
end

-- Update current object status
function Object:Update(dt)
	if Engine.editingMode then
		if not self.__updateObject then
			return
		end
	end
	-- Engine.debug("Updating object "..self.name)
	for i, v in ipairs(self.controls) do
		if v.enabled then
			v:Update(dt)
		end
	end

	if self.Animate ~= nil then
		self.Animate(dt)
	end
	self:UpdateChilds(dt)
end

function Object:UpdateChilds( dt )
	if self.childs == nil then
		return
	end

	for i, v in ipairs(self.childs) do
		v:Update(dt)
	end
end

function Object:Render()
	local cam = Engine.cam or Editor.cam
	
	if not Engine.drawOutOfCam then
		local x, y = self:GetRealPos()
		local w, h = self:GetDimensions()
		if not ((x + w > cam.x) and (x < cam.x + cam.w) and (y + h > cam.y) and (y < cam.y + cam.h)) then
			return
		end
	end

	love.graphics.setColor(self.colorFilter.r, self.colorFilter.g, self.colorFilter.b, self.colorFilter.a)

	if self.drawable ~= nil then
		love.graphics.draw(self.drawable, self.distance/100 * (self.x + self.px), self.distance/100*(self.y + self.py), self.rot, self.distance/100, self.distance/100, self.ox, self.oy)
	elseif self.engineSprite ~= nil and (not Engine.rtSimulation) then
		love.graphics.draw(self.engineSprite, self.distance/100 * (self.x + self.px), self.distance/100*(self.y + self.py), self.rot, self.distance/100, self.distance/100, self.ox, self.oy)
	end

	if self.childs ~= nil then
		for i, v in ipairs(self.childs) do
			-- Absolute Screen Coordinates depends on parent's position
			v.px = self.px + self.x
			v.py = self.py + self.y
			v:Render()
		end
	end
end

--[[ Control Handling methods. ]]

function Object:AddControl(ctrl)
	Engine.debug("Adding Control to object "..self.name)
	local c = ctrl:Fork()
	c.parent = self
	table.insert(self.controls, c)
end

function Object:GetControl(name)
	for _, v in ipairs(self.controls) do
		if v.name == name then
			Engine.debug("contol "..v.name.." found.")
			return v
		end
	end
	Engine.debug("control "..name.." was not found.")
end

function Object:PrintControls()
	print("Object : "..self.name)
	for i, v in ipairs(self.controls) do
		print("\tControl #"..i.." : "..v.class.name)
	end
end

-- Remove control by name.
function Object:RemoveControl(name)
for i, v in ipairs(self.controls) do
		if v.name == name then
			table.remove(self.controls, i)
			break
		end
	end
end

-- Object Coordinates and size 
function Object:GetDimensions()
	return self:GetWidth()* (self.distance/100) , self:GetHeight()* (self.distance/100)
end

function Object:GetWidth()
	if self.drawable ~= nil then
		return self.drawable:getWidth() * (self.distance/100)
	elseif self.engineSprite ~= nil then
		return self.engineSprite:getWidth() * (self.distance/100)
	else
		return 0  
	end
end

function Object:GetHeight()
	if self.drawable ~= nil then
		return self.drawable:getHeight() * (self.distance/100)
	elseif self.engineSprite ~= nil then
		return self.engineSprite:getHeight()* (self.distance/100)
	else
		return 0  
	end
end

-- Returns object position on the screen starting from object's ox and oy.
function Object:GetRealPos()
	return (self.x - self.ox)* (self.distance/100), (self.y - self.oy)* (self.distance/100)
end

-- Returns object's start position in the screen
function Object:GetPos()
	return self.x* (self.distance/100), self.y* (self.distance/100)
end

function Object:GetSize()
	if self.drawable == nil then
		if self.engineSprite == nil then
			return 0, 0
		end
		return self.engineSprite:getWidth()* (self.distance/100), self.engineSprite:getHeight()* (self.distance/100)
	end

	return self.drawable:getWidth()* (self.distance/100), self.drawable:getHeight()* (self.distance/100)
end

-- Makes a copy of an object.
function Object:Fork(name)
	-- Save and remove so fork wont crash
	local o = utils.Fork(self)
	o.name = name
	return o
end

return Object