
--[[
	Scene Properties viewer.
]]

local SceneProperties = { }


function SceneProperties:Create(scene)
	if Editor.uiFlags.SceneProperties then
		Editor.uii.SceneProperties:Remove()
		return nil
	end

	Editor.uiFlags.SceneProperties = true

	local self = {frame = loveframes.Create("frame")}

	local frame = self.frame
	frame:SetName("Grid Properties")
	frame:SetDockable(false)
	frame:Center()
	frame:SetSize(200, 220)	

	frame.OnClose = function()
		self:Remove()
	end

	local grid = loveframes.Create("grid", frame)
	grid:SetPos(5, 30)
	grid:SetRows(6)
	grid:SetColumns(2)
	grid:SetCellWidth(85)
	grid:SetCellHeight(20)
	grid:SetCellPadding(5)
	grid:SetItemAutoSize(true)

	local lblSceneName = loveframes.Create("text"):SetText("Name")
	local lblSceneWidth= loveframes.Create("text"):SetText("Width")
	local lblSceneHeight= loveframes.Create("text"):SetText("height")
	local lblSceneEnter = loveframes.Create("text"):SetText("OnLoad")
	local lblSceneClose= loveframes.Create("text"):SetText("OnClose")
	local lblSceneUpdate= loveframes.Create("text"):SetText("DoUpdate")

	local inSceneName = loveframes.Create("textinput")
	inSceneName.OnFocusLost = function(self)
		scene.name = self:GetText()
	end

	if not inSceneName:GetFocus() then
		inSceneName:SetText(scene.name)
	end

	local inSceneWidth = loveframes.Create("numberbox")
	inSceneWidth:SetMinMax(0, math.inf)
	inSceneWidth.OnValueChanged = function(self, value)
		scene.w = value
	end
	inSceneWidth:SetValue(scene.w)

	local inSceneHeight = loveframes.Create("numberbox")
	inSceneHeight:SetMinMax(0, math.inf)
	inSceneHeight.OnValueChanged = function(self, value)
		scene.h = value
	end
	inSceneHeight:SetValue(scene.h)

	-- Button OnEnter
	local btnOnEnter = loveframes.Create("button")
	if scene.OnLoad ~= nil then
		btnOnEnter:SetText("Update")
	else
		btnOnEnter:SetText("Add")
	end
	btnOnEnter.OnClick = function(self)
		-- Open Favorite text Editor
	end

	-- Button OnClose
	local btnOnClose = loveframes.Create("button")
	if scene.OnLoad ~= nil then
		btnOnClose:SetText("Update")
	else
		btnOnClose:SetText("Add")
	end
	btnOnClose.OnClick = function(self)
		-- Open Favorite text Editor
	end

	-- Button DoUpdate
	local btnDoUpdate = loveframes.Create("button")
	if scene.OnLoad ~= nil then
		btnDoUpdate:SetText("Update")
	else
		btnDoUpdate:SetText("Add")
	end
	btnDoUpdate.OnClick = function(self)
		-- Open Favorite text Editor
	end

	grid:AddItem(lblSceneName, 1, 1)
	grid:AddItem(inSceneName, 1, 2)
	grid:AddItem(lblSceneWidth, 2, 1)
	grid:AddItem(inSceneWidth, 2, 2)
	grid:AddItem(lblSceneHeight, 3, 1)
	grid:AddItem(inSceneHeight, 3, 2)
	grid:AddItem(lblSceneEnter, 4, 1)
	grid:AddItem(btnOnEnter, 4, 2)
	grid:AddItem(lblSceneClose, 5, 1)
	grid:AddItem(btnOnClose, 5, 2)
	grid:AddItem(lblSceneUpdate, 6, 1)
	grid:AddItem(btnDoUpdate, 6, 2)

	setmetatable(self, {__index = SceneProperties})
	return self

end

function SceneProperties:Remove()
	self.frame:Remove()
	Editor.uiFlags.SceneProperties = false
end

return SceneProperties
