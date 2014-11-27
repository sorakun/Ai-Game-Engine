
--[[
	Toolbox
]]


local ToolBar = {}

function ToolBar:Create()

	if Editor.uiFlags.ToolBar then
		Editor.uii.ToolBar:Remove()
		return nil
	end

	Editor.uiFlags.ToolBar = true

	local self = { frame = loveframes.Create("frame")}
	local frame = self.frame

	frame:SetName("Manager")
	frame:SetDockable(true)
	frame:SetSize(500, 63)

	frame.OnClose = function()
		self:Remove()
	end

	-- Set Initial Position
	frame:SetPos(0, 0)

	local list = loveframes.Create("list", frame)
	list:SetPos(5, 30)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(490, 28)
	list:EnableHorizontalStacking(true)
	list:SetDisplayType("horizontal")
	-- Button Enable simulation setup

	local btnStart = loveframes.Create("imagebutton", frame)
	btnStart:SetImage("resources/famfamfam/control_play_blue.png")
	btnStart:SetText("")
	btnStart.OnClick = function()
		Editor.EnableSimulation()
	end
	btnStart:SetWidth(50)

	local btnStop = loveframes.Create("imagebutton", frame)
	btnStop:SetImage("resources/famfamfam/control_stop_blue.png")
	btnStop:SetText("")
	btnStop.OnClick = function()
		Editor.DisableSimulation()
	end

	local btnLoad = loveframes.Create("imagebutton", frame)
	btnLoad:SetImage("resources/famfamfam/folder.png")
	btnLoad:SetText("")
	btnLoad.OnClick = function()
		Editor.DisplayProjectLoader()
	end

	local btnSave = loveframes.Create("imagebutton", frame)
	btnSave:SetImage("resources/famfamfam/bullet_disk.png")
	btnSave:SetText("")
	btnSave.OnClick = function()
		project.save()
	end

	local btnReload = loveframes.Create("imagebutton", frame)
	btnReload:SetImage("resources/famfamfam/arrow_refresh.png")
	btnReload:SetText("")
	btnReload.OnClick = function()
		-- reload
		if Editor.cam.scene ~= nil then
			Editor.cam.scene:LoadDefaults()
		end
	end

	local btnScene = loveframes.Create("imagebutton", frame)
	btnScene:SetImage("resources/famfamfam/image.png")
	btnScene:SetText("")
	btnScene.OnClick = function()
		Editor.DisplaySceneList(project.data.scenes)
	end

	local btnObject = loveframes.Create("imagebutton", frame)
	btnObject:SetImage("resources/famfamfam/plugin.png")
	btnObject:SetText("")
	btnObject.OnClick = function()
		Editor.DisplayObjectList(project.data.objects)
	end

	local btnControl = loveframes.Create("imagebutton", frame)
	btnControl:SetImage("resources/famfamfam/script.png")
	btnControl:SetText("")
	btnControl.OnClick = function()
		--Editor.DisableSimulation()
	end

	list:AddItem(btnStart)
	list:AddItem(btnStop)
	list:AddItem(btnLoad)
	list:AddItem(btnSave)
	list:AddItem(btnReload)
	list:AddItem(btnScene)
	list:AddItem(btnObject)
	list:AddItem(btnControl)

	setmetatable(self, {__index = ToolBar})
	return self
end


function ToolBar:Remove()
	self.frame:Remove()
	Editor.uiFlags.ToolBar = false
	Engine.debug("Removing ToolBox ui")
end

return ToolBar