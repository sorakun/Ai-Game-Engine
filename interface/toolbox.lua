
--[[
	Toolbox
]]


local ToolBox = {}

function ToolBox:Create()

	if Editor.uiFlags.ToolBox then
		Editor.uii.ToolBox:Remove()
		return nil
	end

	Editor.uiFlags.ToolBox = true

	local self = { frame = loveframes.Create("frame")}
	local frame = self.frame

	frame:SetName("ToolBox")
	frame:SetDockable(true)
	frame:Center()
	frame:SetSize(210, 300)

	frame.OnClose = function()
		self:Remove()
	end

	local list = loveframes.Create("list", frame)
	list:SetPos(5, 30)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(200, 270)

	-- Button Enable simulation setup
	local buttonEnableSimulation = loveframes.Create("button", frame)
	buttonEnableSimulation:SetText("Start Simulation")
	buttonEnableSimulation:Center()
	buttonEnableSimulation.OnClick = function()
		if Editor.rtSimulation then
			buttonEnableSimulation:SetText("Start Simulation")
			Editor.DisableSimulation()
		else
			Editor.EnableSimulation()
			buttonEnableSimulation:SetText("Stop Simulation")
		end
	end

		-- Button Scene Navigator Setup
	local buttonSceneNavigator= loveframes.Create("button", frame)
	buttonSceneNavigator:SetText("Scene Navigator")
	buttonSceneNavigator:Center()

	buttonSceneNavigator.OnClick = function()
		Editor.DisplaySceneNavigator()
	end

	local buttonGridSettings = loveframes.Create("button", frame)
	buttonGridSettings:SetText("Grid Settings")

	buttonGridSettings.OnClick = function()
		Editor.DisplayGridProperties()
	end

	-- Button Project Settings
	local buttonProjectLoader= loveframes.Create("button", frame)
	buttonProjectLoader:SetText("Load Project")	buttonProjectLoader:Center()

	buttonProjectLoader.OnClick = function()
		Editor.DisplayProjectLoader()
	end

	-- Button Save Project
	local buttonSaveProject= loveframes.Create("button", frame)
	buttonSaveProject:SetText("Save Project"):Center()

	buttonSaveProject.OnClick = function()
		-- Save Project
		project.save()
	end

	-- Button Object Inspector
	local buttonObjectInspector = loveframes.Create("button", frame)
	buttonObjectInspector:SetText("Object Inspector")
	buttonObjectInspector:Center()

	buttonObjectInspector.OnClick = function()
		Editor.DisplayObjectList(project.data.objects)
	end

	local buttonMapEditor = loveframes.Create("button", frame)
	buttonMapEditor:SetText("Scene Inspector")
	buttonMapEditor:Center()

	buttonMapEditor.OnClick = function()
		Editor.DisplaySceneList(project.data.scenes)
	end

	local buttonHelp = loveframes.Create("button", frame)
	buttonHelp:SetText("Help")
	buttonHelp:Center()

	list:AddItem(buttonEnableSimulation)
	list:AddItem(buttonSceneNavigator)
	list:AddItem(buttonGridSettings)
	list:AddItem(buttonProjectLoader)
	list:AddItem(buttonSaveProject)
	list:AddItem(buttonObjectInspector)
	list:AddItem(buttonMapEditor)
	list:AddItem(buttonHelp)

	setmetatable(self, {__index = ToolBox})
	return self
end


function ToolBox:Remove()
	self.frame:Remove()
	Editor.uiFlags.ToolBox = false
	Engine.debug("Removing ToolBox ui")
end

return ToolBox