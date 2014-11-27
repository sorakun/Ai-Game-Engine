
--[[
	Object Properties Viewer
]]

local ObjectProperties = { }

function ObjectProperties:Create()
	if Editor.uiFlags.ObjectProperties then
		Editor.uii.ObjectProperties:Remove()
		return nil
	end

	Editor.uiFlags.ObjectProperties = true

	local self = { frame = loveframes.Create("frame") }

	local frameOP = self.frame 
	frameOP:SetName("Object Properties")
	frameOP:SetSize(300, 400)
	frameOP:Center()

	frameOP.OnClose = function()
		self:Remove()
	end

	self.grid  = loveframes.Create("grid", frameOP)

	local grid = self.grid
	grid:SetPos(5, 30)
	grid:SetRows(12)
	grid:SetColumns(2)
	grid:SetCellWidth(135)
	grid:SetCellHeight(20)
	grid:SetCellPadding(5)
	grid:SetItemAutoSize(true)

	local  lblx, lbly, lblox, lbloy, lblsx, lblsy, lblrot, lbllayer, lblColor, lblupdate, lblcontrols 

	local lblname = loveframes.Create("text", frameOP)
	lblname:SetText("Name")

	lblx = loveframes.Create("text", frameOP)
	lblx:SetText("position x-axis")
	lbly = loveframes.Create("text", frameOP)
	lbly:SetText("position y-axis")

	lblox = loveframes.Create("text", frameOP)
	lblox:SetText("origin offset x-axis")

	lbloy = loveframes.Create("text", frameOP)
	lbloy:SetText("origin offset y-axis")

	lblsx = loveframes.Create("text", frameOP)
	lblsx:SetText("scale factor x-axis")

	lblsy = loveframes.Create("text", frameOP)
	lblsy:SetText("scale factor y-axis")

	lblrot = loveframes.Create("text", frameOP)
	lblrot:SetText("orientation")

	lbllayer = loveframes.Create("text", frameOP)
	lbllayer:SetText("layer")

	lblColor = loveframes.Create("text", frameOP)
	lblColor:SetText("Color Filter")

	lblupdate= loveframes.Create("text", frameOP)
	lblupdate:SetText("Update object")

	lblcontrols = loveframes.Create("text", frameOP)
	lblcontrols:SetText("Controls")

	--inname = loveframes.Create("textinput")
	--inname:SetText("Name")
	self.inname = loveframes.Create("textinput", frameOP)
	self.inname:SetEditable(false)
	self.inx = loveframes.Create("numberbox", frameOP)
	self.inx:SetMax(math.inf)

	self.iny = loveframes.Create("numberbox", frameOP)
	self.iny:SetMax(math.inf)

	self.inox = loveframes.Create("numberbox", frameOP)
	self.inox:SetMax(math.inf)

	self.inoy = loveframes.Create("numberbox", frameOP)
	self.inoy:SetMax(math.inf)

	self.insx = loveframes.Create("numberbox", frameOP)
	self.insx:SetMax(math.inf)

	self.insy = loveframes.Create("numberbox", frameOP)
	self.insy:SetMax(math.inf)

	self.inrot = loveframes.Create("numberbox", frameOP)
	self.inrot:SetMinMax(-359, math.inf)

	self.inlayer = loveframes.Create("numberbox", frameOP)
	self.inlayer:SetMinMax(0, math.inf)

	self.btnChangeColor = loveframes.Create("button", frameOP)
	self.btnChangeColor:SetText("Change Color")

	self.inupdate = loveframes.Create("button", frameOP)
	self.inupdate:SetText("Disable")

	self.btncontrols = loveframes.Create("button", frameOP)
	self.btncontrols:SetText("View Controls")

	self.btnChangeColor.OnClick = function()
		if o ~= nil then
			require("interface.colorpicker"):Create(o.colorFilter, "Select object "..o.name.." color filter")
		end
	end

	grid:AddItem(lblname, 1, 1)
	grid:AddItem(self.inname, 1, 2)
	grid:AddItem(lblx, 2, 1)
	grid:AddItem(self.inx, 2, 2)
	grid:AddItem(lbly, 3, 1)
	grid:AddItem(self.iny, 3, 2)
	grid:AddItem(lblox, 4, 1)
	grid:AddItem(self.inox, 4, 2)
	grid:AddItem(lbloy, 5, 1)
	grid:AddItem(self.inoy, 5, 2)
	grid:AddItem(lblsx, 6, 1)
	grid:AddItem(self.insx, 6, 2)
	grid:AddItem(lblsy, 7, 1)
	grid:AddItem(self.insy, 7, 2)
	grid:AddItem(lblrot, 8, 1)
	grid:AddItem(self.inrot, 8, 2)
	grid:AddItem(lbllayer, 9, 1)
	grid:AddItem(self.inlayer, 9, 2)
	grid:AddItem(lblColor, 10, 1)
	grid:AddItem(self.btnChangeColor, 10, 2)
	grid:AddItem(lblupdate, 11, 1)
	grid:AddItem(self.inupdate, 11, 2)
	grid:AddItem(lblcontrols, 12, 1)
	grid:AddItem(self.btncontrols, 12, 2)

	setmetatable(self, {__index = ObjectProperties})

	self:UpdateOP(Editor.selected)
	return self
end

--[[ 
	Update the object properties
	Take a list of objects as a parameter.
]]

function ObjectProperties:UpdateOP(objects)
	if objects == nil then 
		return
	end

	-- Currently works on one object
	-- TODO multiple selected objects

	local o = objects[1]
	if o == nil or self.frame == nil then
		return
	end

	self.inname.OnFocusLost = function(object)
		o.name = self.inname:GetText()
		Engine.debug("Focus Lost text = "..(self.inname:GetText()))
	end
	if not self.inname:GetFocus() then
		self.inname:SetText(o.name)
	end

	self.inx.OnValueChanged = function(object, value)
		o.x = value
		Engine.debug("Moving object "..o.name..".")
	end
	self.inx:SetValue(o.x)

	self.iny.OnValueChanged = function(object, value)
		o.y = value
	end
	self.iny:SetValue(o.y)

	self.inox.OnValueChanged = function(object, value)
		o.ox = value
	end
	self.inox:SetValue(o.ox)

	self.inoy.OnValueChanged = function(object, value)
		o.oy = value
	end
	self.inoy:SetValue(o.oy)

	self.insx.OnValueChanged = function(object, value)
		o.sx = value/100
	end
	self.insx:SetValue(o.sx*100)

	self.insy.OnValueChanged = function(object, value)
		o.sy = value/100
	end
	self.insy:SetValue(o.sy * 100)

	self.inrot.OnValueChanged = function(object, value)
		if value > 360 then
			value = value - 360
		elseif value < -360 then
			value = 360 - value
		end

		o.rot = math.rad(value)
	end
	self.inrot:SetValue(math.deg(o.rot))

	self.inlayer.OnValueChanged = function(object, value)
		o.layer = value
		if Editor.cam.scene ~= nil then
			Editor.cam.scene:RefreshObjectsTable()
		end
	end
	self.inlayer:SetValue(o.layer)

	if o.__updateObject == true then
		self.inupdate:SetText("Disable")
	else
		self.inupdate:SetText("Enable")
	end

	self.inupdate.OnClick = function (self)
		if o.__updateObject == true then
			self:SetText("Enable")
		else
			self:SetText("Disable")
		end
		o.__updateObject = not o.__updateObject 
	end
end

function ObjectProperties:Remove()
	self.frame:Remove()
	Editor.uiFlags.ObjectProperties = false
	Engine.debug("Removing ObjectProperties ui")
end

return ObjectProperties