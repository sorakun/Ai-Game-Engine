
--[[
	愛 - Ai Game Engine.
	Written by Chouri Soulaymen 
		sora.chouri@gmail.com
		http://sora.eliteheberg.fr	
]]

require("object.object")
require("control.control")
require("scene.scene")
require("camera.camera")
require("project.project")
require("math.math")
local Polygon = require("math.polygon")

Engine = { }

-- Enable debug messages.
Engine.debugEnabled = true 

-- Engine run mode or editing mode, must be set to false after finishing with the engine.
Engine.editingMode = true

-- Engine name and version.
Engine.namejp = "愛"
Engine.name = "Ai"
Engine.version = "0.0.1"
Engine.drawTitle = true

-- Draw objects outside of the camera.
-- Disabling this might increase performance a lot.
Engine.drawOutOfCam = false

function Engine.debug(out)
	if Engine.debugEnabled then
		print(out)
	end
end

-- Are we in editing mode or release mode?
if Engine.editingMode then
	require("lovedebug")
	require("editor.editor")
	require("editor.selection")
	require("editor.grid")
	require("editor.titlerender")

	Engine.Start = Editor.Start
	Engine.Render = Editor.Render
	Engine.Update = Editor.Update
	Engine.Resize = Editor.Resize
	Engine.MousePressed = Editor.MousePressed
	Engine.MouseReleased = Editor.MouseReleased
	Engine.KeyPressed = Editor.KeyPressed
	Engine.KeyReleased = Editor.KeyReleased
	Engine.Quit = Editor.Quit
	Engine.TextInput = Editor.TextInput
	Engine.cam = nil

	local p = Polygon:new({{1, 1}, {2, 2}, {10, 10}})
	p:Print()
else
--[[
	Game = { }
	
	Engine.Start = function ( )
		if Game.Start !=
	end
]]
end



