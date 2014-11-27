--[[
	A scene could be a game map/level or a game menu.
]]

local class = require "oop.middleclass"

local Scene = class("Scene")

function Scene:initialize(nameId, w, h)
	Engine.debug("Creating Scene \"".. nameId.."\"")

	self.objects = {}
	self.bgColor = {r = 255, g = 255, b = 255, a = 255}
	self.w = w
	self.h = h
	self.name = nameId

	-- Override this function if there is anything to be done considering the scene or its objects.
	self.DoUpdate = nil

	-- Override this function if there is anything to be done at the first load of the scene.
	self.OnLoad = nil

	-- Override this function if there is anything to be done when the scene quits.
	self.OnExit = nil

	-- Static objects such as buildings, etc.
	self.staticObjects = {}

	if Engine.editingMode then
		project.AddScene(self)
	end
end

function Scene:SaveSceneDefaults()
	local sc = {
		bgColor = {
			r = self.bgColor.r,
			g = self.bgColor.g,
			b = self.bgColor.b,
			a = self.bgColor.a,
		},

		staticObjects = {},

		w = self.w,
		h = self.h
	}

	for i,v in ipairs(self.objects) do
		if v.isStatic then
			local o = {
				name = v.name,
				class = v.class.name,
				x = v.x,
				y = v.y,
				ox = v.ox,
				oy = v.oy,
				sx = v.sx,
				sy = v.sy,
				px = v.px,
				py = v.py,
				visible = v.visible,
				rot = v.rot,
				layer = v.layer,
				distance = v.distance,
				controls = {}
			}

			-- Controls are created in code.
			-- TODO Add static controls
			--[[
			for j, w in ipairs(v.controls) do
				table.insert(o.controls, w.class.name)
			end
			]]
			table.insert(sc.staticObjects, o)
			
		end
	end

	table.save(sc, "projects/"..project.name.."/scenes/"..self.name.."/defaults.table")
end

function Scene:LoadSceneDefaults()
	local sc = table.load("projects/"..project.name.."/scenes/"..self.name.."/defaults.table")
	if sc == nil then 
		return 
	end

	-- Remove static objects, to reload them from the file.
	local newTable = {}
	for i,v in ipairs(self.objects) do
		if not v.isStatic then
			table.insert(newTable, v)
		else
			if Editor.IsSelected(v) then
				Editor.Deselect(v)
			end
		end
	end

	self.objects = newTable

	self.bgColor.r = sc.bgColor.r
	self.bgColor.g = sc.bgColor.g
	self.bgColor.b = sc.bgColor.b
	self.bgColor.a = sc.bgColor.a

	for i, v in ipairs(sc.staticObjects) do
		local o = project.ImportObject(v.class):new()
		o.name = v.name
		o.visible = v.visible
		o.x = v.x
		o.y = v.y
		o.ox = v.ox
		o.oy = v.oy
		o.sx = v.sx
		o.sy = v.sy
		o.px = v.px
		o.py = v.py
		o.rot = v.rot
		o.layer = v.layer
		o.distance = v.distance
		o.isStatic = true
		for j,w in ipairs(v.controls) do
			o:AddControl(project.ImportControl(w):new())
		end

		self:AddObject(o)
	end

	self.w = sc.w
	self.h = sc.h
end

-- Event parameters: evt(obj, dt)
function Scene:AttachUpdateEvent(evt)
	self.DoUpdate = evt
end

function Scene:AddObject(o)
	table.insert(self.objects, o)
	table.sort(self.objects, function(o1, o2) 
		if o1.distance == o2.distance then
			return o1.layer > o2.layer
		else
			return o1.distance > o2.distance 
		end
	 end)
end

function Scene:AddStaticObject(o)
	table.insert(self.staticObjects, o)
	table.sort(self.staticObjects, function(o1, o2) 
		if o1.distance == o2.distance then
			return o1.layer > o2.layer
		else
			return o1.distance > o2.distance 
		end
	 end)
end


function Scene:RemoveObject(o)
	Engine.debug("Removing object "..o.name.." from scene.")
	for i, v in ipairs(self.objects) do
		if v == o then
			table.remove(self.objects, i)
			Engine.debug("Object "..o.name.. " removed from scene "..self.name..".")
			return
		end
	end
end

-- This is called by Engine.LoadScene.
function Scene:Load()
	if self.DoLoad ~= nil then
		self.DoLoad()
	end
end

function Scene:Exit()
	if self.OnExit ~= nil then
		self.OnExit()
	end
end

-- This is called by the engine not the user.
function Scene:UpdateObjects(dt)
	for i, v in ipairs(self.objects) do
		v:Update(dt)
	end
end

function Scene:Update(dt)
	if self.DoUpdate ~= nil then
		self.DoUpdate(self, dt)
	end

	self:UpdateObjects(dt)
end

function Scene:Render()
	love.graphics.setBackgroundColor(self.bgColor.r, 
			self.bgColor.g, 
			self.bgColor.b)
	for i, v in ipairs(self.objects) do
		v:Render(dt)
	end
end

function Scene:RefreshObjectsTable()
	table.sort(self.objects, function(o1, o2) return o1.layer > o2.layer end)
end

function Scene:LoadDefaults()
	self:LoadSceneDefaults()
	for _,v in ipairs(self.objects) do
		v:LoadDefaults(self)
	end
end

function Scene:SaveDefaults()
	self:SaveSceneDefaults()
	for _,v in ipairs(self.objects) do
		v:SaveDefaults(self)
	end
end

return Scene