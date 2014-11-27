
--[[
	Scene list view frame.
]]

local SceneList = {}

function SceneList:Create(scenes)
	if Editor.uiFlags.SceneList then
		Editor.uii.SceneList:Remove()
		return
	end

	Editor.uiFlags.SceneList = true

	local self = { frame = loveframes.Create("frame")}

	-- Frame setup
	local frame = self.frame
	frame:SetName("Scene List")
	frame:SetSize(150, 200)
	frame:SetResizable(true)
	-- Set frame pos
	frame:Center()
	frame.OnClose = function()
		self:Remove()
	end

	frame.OnResize = function(object, width, height)
		list:SetSize(width - 10, height - 75)
		filter:SetWidth(width - 10)
	end

	local filter = loveframes.Create("textinput", frame)
	filter:SetPos(5, 30)
	filter:SetWidth(140)

	-- List setup
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 60)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:SetSize(140, 135)

	-- Loading objects.
	for i, v in ipairs(project.data.scenes) do
		local btn = loveframes.Create("button", frame)
		btn:SetText(v.name)
		btn.OnClick = function ()
			Editor.cam:Attach(v)
			Editor.UpdateSceneNav(v.w, v.h)
		end
		list:AddItem(btn)
	end
	setmetatable(self, {__index = SceneList})
	return self
end

function SceneList:Remove()
	self.frame:Remove()
	Editor.uiFlags.SceneList = false
	Engine.debug("Removing SceneList ui")
end

return SceneList