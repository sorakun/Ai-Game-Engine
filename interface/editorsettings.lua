--[[
	Editor Settings Frame
]]

local EditorSettings = {}

function EditorSettings:Create()
	if Editor.uiFlags.EditorSettings then
		Editor.uii.EditorSettings:Remove()
		return nil
	end

	Editor.uiFlags.EditorSettings = true

	local self = { frame = loveframes.Create("frame")}
	local frame = self.frame

	frame:SetText("Editor Settings"):Center()
	
	setmetatable(self, {__index = EditorSettings})
	return self	
end

function EditorSettings:Remove()
	self.frame:Remove()
	-- Anything else ..
end

return EditorSettings