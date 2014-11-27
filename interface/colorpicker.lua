--[[
	Create and displays a colo picker dialog
	parameters!
		c: Color to update
		msg: Personal Window Message 
]]

local ColorPicker = { }


function ColorPicker:Create(c, msg)
	if Editor.uiFlags.ColorPicker then
		Editor.uii.ColorPicker:Remove()
		return nil
	end

	Editor.uiFlags.ColorPicker = true
	
	local self = { color = c, message = msg }

	setmetatable(self, {__index = ColorPicker})
	self:DisplayDialog()
	return self
end

function ColorPicker:DisplayDialog()
	local color = self.color
	self.frame = loveframes.Create("frame")
	local frame = self.frame
	frame:SetDockable(true)
	frame:SetName(self.message)
	frame:SetSize(500, 295)
	
	frame.OnClose = function()
		self:Remove()
	end

	local colorbox = loveframes.Create("panel", frame)
	colorbox:SetPos(5, 30)
	colorbox:SetSize(490, 100)
	colorbox.Draw = function(object)
		local c = {color.r, color.g, color.b, color.a}
		love.graphics.setColor(c)
		love.graphics.rectangle("fill", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
		love.graphics.setColor(143, 143, 143, 255)
		love.graphics.setLineWidth(1)
		love.graphics.setLineStyle("smooth")
		love.graphics.rectangle("line", object:GetX(), object:GetY(), object:GetWidth(), object:GetHeight())
	end
	
	local slider1 = loveframes.Create("slider", frame)
	slider1:SetPos(5, 150)
	slider1:SetWidth(490)
	slider1:SetMax(255)
	slider1:SetDecimals(0)
	slider1:SetValue(color.r)
	slider1.OnValueChanged = function(object, value)
		color.r = value
	end
	
	local slider1name = loveframes.Create("text", frame)
	slider1name:SetPos(5, 135)
	slider1name:SetText("Red")
	
	local slider1value = loveframes.Create("text", frame)
	slider1value:SetPos(470, 135)
	slider1value.Update = function(object)
		object:SetText(slider1:GetValue())
	end
	
	local slider2 = loveframes.Create("slider", frame)
	slider2:SetPos(5, 190)
	slider2:SetWidth(490)
	slider2:SetMax(255)
	slider2:SetDecimals(0)
	slider2:SetValue(color.g)
	slider2.OnValueChanged = function(object, value)
		color.g = value
	end
	
	local slider2name = loveframes.Create("text", frame)
	slider2name:SetPos(5, 175)
	slider2name:SetText("Green")
	
	local slider2value = loveframes.Create("text", frame)
	slider2value:SetPos(470, 175)
	slider2value.Update = function(object)
		object:SetText(slider2:GetValue())
	end
	
	local slider3 = loveframes.Create("slider", frame)
	slider3:SetPos(5, 230)
	slider3:SetWidth(490)
	slider3:SetMax(255)
	slider3:SetDecimals(0)
	slider3:SetValue(color.b)
	slider3.OnValueChanged = function(object, value)
		color.b = value
	end
	
	local slider3name = loveframes.Create("text", frame)
	slider3name:SetPos(5, 215)
	slider3name:SetText("Blue")
	
	local slider3value = loveframes.Create("text", frame)
	slider3value:SetPos(470, 215)
	slider3value.Update = function(object)
		object:SetText(slider3:GetValue())
	end
	
	local slider4 = loveframes.Create("slider", frame)
	slider4:SetPos(5, 270)
	slider4:SetWidth(490)
	slider4:SetMax(255)
	slider4:SetDecimals(0)
	slider4:SetValue(color.a)
	slider4.OnValueChanged = function(object, value)
		color.a = value
	end
	
	local slider4name = loveframes.Create("text", frame)
	slider4name:SetPos(5, 255)
	slider4name:SetText("Alpha")
	
	local slider4name = loveframes.Create("text", frame)
	slider4name:SetPos(470, 255)
	slider4name.Update = function(object)
		object:SetText(slider4:GetValue())
	end
end

function ColorPicker:Remove()
	self.frame:Remove()
	Editor.uiFlags.ColorPicker = false
	Engine.debug("Removing Colorpicker ui")
end

return ColorPicker
