--[[ Game structure]]
local Camera = require("camera.camera")

local Game = {  }

Game.name = "untitled"

-- Default game start up scene index.
Game.startUpScene = 1

function Game.Init(title)
	Game.name = title
	Game.camera = Camera:Create()
end

--[[ Input Managers ]]
Game.kbInputManagers = {}
Game.MouseInputManagers = {}

function Game.AddKbInputManager(inmgr)
	table.insert(Game.kbInputManagers, inmgr)
end

function Game.AddMouseInputManager(inmgr)
	table.insert(Game.MouseInputManagers, inmgr)
end

--[[ Scenes ]]
function Game.SetScene(scene)
	if Game.scene ~= nil then
		Game.scene:Exit()
	end
	Game.scene = scene
	scene:Load()
end

--[[ Events ]]
function Game.Update(dt)
	if Engine.editingMode then
		if Editor.updateCamera then
			Game.camera:Update(dt)
		end
	else
		Game.camera:Update(dt)
	end
end

function Game.KeyPressed(key)
	for _, v in ipairs(Game.kbInputManagers) do
		v:KeyPressed(key)
	end
end

function Game.KeyReleased(key)
	for _, v in ipairs(Game.kbInputManagers) do
		v:KeyReleased(key)
	end
end

function Game.MousePressed(x, y, button)
	for _, v in ipairs(Game.MouseInputManagers) do
		v:MousePressed(button)
	end
end

function Game.MouseReleased(x, y, button)
	for _, v in ipairs(Game.MouseInputManagers) do
		v:MouseReleased(button)
	end
end

function Game.start()
	Game.SetScene(project.scenes[Game.startUpScene])
end

return Game