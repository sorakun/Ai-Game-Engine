
--[[
	Selected Objects List
	This window have direct access to the editor's selected objects. 
]]

local SelectedList = {}

function SelectedList:Create()
	if Editor.uiFlags.SelectedList then
		Editor.uii.SelectedList:Remove()
		return nil
	end

	Editor.uiFlags.SelectedList = true

	local self = { 
		frame = loveframes.Create("frame"),
	}

	local frame = self.frame
	frame:SetPos(x, y):SetName("Selection"):SetSize(110, 230):Center()

	frame.OnClose = function()
		self:Remove()
	end
	
	self.list = loveframes.Create("list", frame)
	local list = self.list

	list:SetSize(100, 200):SetPos(5, 30)

	setmetatable(self, {__index = SelectedList})
	self:Update()

	return self
end


function SelectedList:Update()
	if Editor.selected == nil then
		return
	end

	self.list:Clear()
	for _,v in ipairs(Editor.selected) do
		local btn = loveframes.Create("button", self.frame)
		btn:SetText(v.name)
		self.list:AddItem(btn)
	end
end

function SelectedList:Remove()
	self.frame:Remove()
	self.btnList = nil
	self.objList = nil
	Editor.uiFlags.SelectedList = false
	Engine.debug("Removing SelectedList ui")
end

return SelectedList