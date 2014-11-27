--[[
	ObjectList: Displays a list of objects 
	which can be added to scene.
]]

local ObjectList = { }

--[[
	parameter objList: List of objects.
]]

local utils = require("utilities.utils")

function ObjectList:Create(objList)
	if Editor.uiFlags.ObjectList then
		Editor.uii.ObjectList:Remove()
		return nil
	end

	Editor.uiFlags.ObjectList = true

	local self = {frame = loveframes.Create("frame"), toolTips = {} }

	-- Frame setup
	local frame = self.frame
	frame:SetName("Object List")
	frame:SetSize(200, 200)
	frame:SetResizable(true)
	frame:SetMaxWidth(math.inf)
	frame:SetMaxHeight(math.inf)
	frame:Center()

	-- TODO: Name filter 
	local filter = loveframes.Create("textinput", frame)
	filter:SetPos(5, 30)
	filter:SetWidth(190)

	-- List setup
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 60)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(190, 130)

	-- Loading objects.
	--
	

	for i, v in ipairs(objList) do
		local imagebutton = loveframes.Create("imagebutton", frame)
		imagebutton:SetImage(v.drawable)
		imagebutton:SetText("")
		
		local tooltip = loveframes.Create("tooltip", frame)
		tooltip:SetObject(imagebutton)
		tooltip:SetPadding(10)
		tooltip:SetText(v.name)
		
		table.insert(self.toolTips, tooltip)

		imagebutton:SizeToImage()
		imagebutton.OnClick = function(object)
			if Editor.cam.scene ~= nil then
				Engine.debug("Adding object "..v.name.." to scene.")
				local o = project.ImportObject(v.class.name):new()
				o.name = utils.RandomString()
				o.isStatic = true
				Editor.cam.scene:AddObject(o)
				Editor.Select(o)
				o.__selectionX = 0
				o.__selectionY = 0
				Editor.moveSO = true
			end
		end
		list:AddItem(imagebutton)
	end

	setmetatable(self, {__index = ObjectList})

	frame.OnClose = function()
		self:Remove()
	end

	frame.OnResize = function(object, width, height)
		list:SetSize(width - 10, height - 80)
		filter:SetWidth(width - 10)
	end

	return self
end

function ObjectList:Remove()
	Engine.debug("Removing ObjectList ui")
	self.frame:Remove()
	self.toolTips = nil
	Editor.uiFlags.ObjectList = false
end

return ObjectList