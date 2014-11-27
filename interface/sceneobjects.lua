-- Unlike others, this uses middleclass.z

local class = require("oop.middleclass")
local SceneObjects = class("SceneObjects")

function SceneObjects:initialize(scene)
	self.frame = loveframes.Create("frame")
	local frame = self.frame

	-- Frame setup
	local frame = self.frame
	frame:SetName("Scene Objects")
	frame:SetSize(200, 300)
	frame:SetResizable(true)
	frame:SetMaxWidth(math.inf)
	frame:SetMaxHeight(math.inf)
	-- Set frame pos

	self.filter = loveframes.Create("textinput", frame)
	local filter = self.filter
	filter:SetPos(5, 30)
	filter:SetWidth(140)
	frame:Center()
	frame.OnClose = function()
		self:Remove()
	end
	
	-- List setup
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 60)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(190, 220)

	frame.OnClose = function()
		self:Remove()
	end

	frame.OnResize = function(object, width, height)
		list:SetSize(width - 10, height - 80)
		filter:SetWidth(width - 10)
	end

	if scene == nil then
		return
	end

	for i, v in ipairs(scene.objects) do
		local btn = loveframes.Create("button", frame)
		btn:SetText(v.name)

		btn.OnClick = function()
			Editor.Select(v)
			Editor.cam:Focus(v.x, v.y)
		end
		list:AddItem(btn)
	end
end


function SceneObjects:Remove()
	Editor.uiFlags.SceneObjects = false
	self.frame:Remove()
end

return SceneObjects