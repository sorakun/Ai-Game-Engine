--[[
	Screen Navigator.
]]

local SceneNavigator = { }

function SceneNavigator:Create()
	if Editor.uiFlags.SceneNavigator then
		Editor.uii.SceneNavigator:Remove()
		return nil
	end

	Editor.uiFlags.SceneNavigator = true

	local self = {frame = nil, sliderX = nil, sliderY = nil}
	self.frame = loveframes.Create("frame")
	self.frame:SetName("Nav"):SetDockable(true):SetSize(250, 85):Center()

	self.frame.OnClose = function()
		self:Remove()
	end

	local maxX = 0
	local maxY = 0
	if Editor.cam.scene ~= nil then
		maxX = Editor.cam.scene.w
		maxY = Editor.cam.scene.h
	end

	local w, h = maxX, maxY

	local sliderX = loveframes.Create("slider", self.frame)
	sliderX:SetWidth(200)
	sliderX:SetMinMax(0, w)
	sliderX:SetButtonSize(20, 10)
	sliderX:SetSlideType("horizontal")
	sliderX:SetPos(30, 35)

	sliderX.OnValueChanged = function(object)
		if Editor.cam ~= nil then
    		Editor.cam.x = math.floor(object:GetValue())
    		--Engine.debug("Changing camera X to "..object:GetValue())
    	end
    end

	local sliderY = loveframes.Create("slider", self.frame)
	sliderY:SetWidth(200)
	sliderY:SetMinMax(0, h)
	sliderY:SetButtonSize(20, 10)
	sliderY:SetSlideType("horizontal")
	sliderY:SetPos(30, 65)

	sliderY.OnValueChanged = function(object)
		if Editor.cam ~= nil then
    		Editor.cam.y = math.floor(object:GetValue())
    		--Engine.debug("Changing camera Y to "..object:GetValue())
    	end
    end

	self.sliderX = sliderX
	self.sliderY = sliderY

	setmetatable(self, {__index = SceneNavigator})
	
	-- Update
	self:RefreshNav(maxX, maxY)
	return self
end


function SceneNavigator:RefreshNav(w, h)
	if not scaneNavigatorDisplayed then
		return
	end

	local sliderX = self.sliderX
	local sliderY = self.sliderY

	
	sliderX:SetValue(w)
	sliderY:SetValue(h)
	
end

function SceneNavigator:Remove()
	self.frame:Remove()
	Editor.uiFlags.SceneNavigator = false
	Engine.debug("Removing SceneNavigator ui")
end

return SceneNavigator