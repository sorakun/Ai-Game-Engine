--[[ Keyboard Input Manager, only one instance is allowed. ]]

local class = require 'oop.middleclass'

local KBInputManager = class("KBInputManager")

function KBInputManager:initialize(id)
	self.name = id
	self.PRESSED = {}
	self.RELEASED = {}
	self.HELD = {}
end

-- event must be taken from the current KBInputManager
function KBInputManager:Set(key, event, ctrl)
	-- pressed used to update on hold event
	-- ccounter = current counter
	event[key] = {control = ctrl, pressed = false, ccounter = 0}
end

function KBInputManager:KeyPressed(key)
	if self.PRESSED[key] ~= nil then
		local ctrl = self.PRESSED[key].control
		ctrl:Enable()
		ctrl:Update(0)
		ctrl:Disable()
	end 

	if self.HELD[key] ~= nil then
		local ctrl = self.HELD[key].control
		ctrl:Enable()
	end 
end

function KBInputManager:KeyReleased(key)
	if self.RELEASED[key] ~= nil then
		local ctrl = self.RELEASED[key].control
		ctrl:Enable()
		ctrl:Update(0)
		ctrl:Disable()
	end 

	if self.HELD[key] ~= nil then
		local ctrl = self.HELD[key].control
		ctrl:Disable()
	end 
end

return KBInputManager