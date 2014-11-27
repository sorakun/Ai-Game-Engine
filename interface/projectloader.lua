--[[
	Project Loader frame.
]]

local ProjectLoader = {}

local utils = require("utilities.utils")

function ProjectLoader:Create()
	if Editor.uiFlags.ProjectLoader then
		Editor.uii.ProjectLoader:Remove()
		return nil
	end

	Editor.uiFlags.ProjectLoader = true

	local self = {}

	self.frame = nil

	setmetatable(self, {__index = ProjectLoader})
	-- Update
	self:DisplayGameSettings()
	return self
end


function ProjectLoader:DisplayGameSettings()
	-- Frame setup
	self.frame = loveframes.Create("frame")
	local frame = self.frame

	frame:SetName("Game Settings")
	frame:SetDockable(true)
	frame:Center()
	frame:SetSize(300, 125)
	frame.OnClose = function ()
		self:Remove()
	end
	-- List setup
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 30)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(285, 90)

	-- Text setup
	local labelName = loveframes.Create("text")
	labelName:SetText("Project Name")
	
	-- Input setup
	local inputName = loveframes.Create("textinput")
	inputName:SetText("template")
	-- Button apply setup
	local buttonApply = loveframes.Create("button", frame)
	buttonApply:SetText("Apply")

	buttonApply.OnClick = function ()
		project.Load(inputName:GetText())
		self:Remove()
	end

	list:AddItem(labelName)
	list:AddItem(inputName)
	list:AddItem(buttonApply)
end

function ProjectLoader:Remove()
	Editor.uiFlags.ProjectLoader = false
	self.frame:Remove()
	Engine.debug("Removing ProjectLoader ui")
end

return ProjectLoader