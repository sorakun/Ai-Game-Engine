require("libs.loveframes")

Editor = { }

-- Realtime simulation enabled or not.
-- Realtime simulation allows rendering but not updating.
Editor.rtSimulation = false

-- Object Selection is done by right clicking at the object first, then moving it.
Editor.objectSelection = false

-- Selected object and intial selections details which we will perform operations such as translation, rotation, etc.
Editor.selected = nil
Editor.selectedPos = {x = 0, y = 0}

-- Move selected objects accoring to mouse position
Editor.moveSO = false

-- Selection Color: Can be changed due to background colors.
Editor.selectionColor = {r = 255, g = 0, b = 0, a = 255}
Editor.window = { w = 0, h = 0 }

-- This is used to handle scene navigation using middle mouse click
Editor.middleMouseClickPos = {x = 0, y = 0}
Editor.navigateUsingMiddleMouse = false

-- Navigation speed:
Editor.navigationSpeed = 0.1
Editor.currentNavAcc = 0 -- Accumulator

-- Editor Grid displayed
Editor.displayGrid = true
Editor.gridXUnit = 70
Editor.gridYUnit = 70
Editor.gridColor = {r = 255, g = 255, b = 255, a = 50}
Editor.stickToGrid = false

-- Editor Editing mode constants
Editor.editingModes =  { translate = 1, rotate = 2 }

Editor.editingMode = Editor.editingModes.translate

-- Editor Font
Editor.fontStd = love.graphics.newFont("resources/fonts/josephineslab/JosefinSlab-Regular.ttf", 20)
Editor.fontTitle = love.graphics.newFont("resources/fonts/ki_kokugo/font_1_kokugl_1.00_rls.ttf", 200)
Editor.fontDesc = love.graphics.newFont("resources/fonts/exo/Exo-ExtraLight.otf", 40)

-- Import Math Library
Editor.Math = require("math.math")

-- Editor user interface Flags
Editor.uiFlags = {
	ColorPicker 		= false,
	scenenavigator 		= false,
	ProjectLoader 		= false,
	GridProperties 		= false,
	ObjectList 			= false,
	ObjectProperties 	= false,
	SceneList			= false,
	SceneProperties		= false,
	ToolBox 			= false,
	ToolBar 			= false,
	SelectedList		= false,
	SceneObjects		= false,
}

-- Editor ui classes
Editor.uic = {
	SceneNavigator 		= require("interface.scenenavigator"),
	ColoPicker     		= require("interface.colorpicker"),
	ProjectLoader  		= require("interface.projectloader"),
	GridProperties 		= require("interface.gridproperties"),
	ObjectList 			= require("interface.objectlist"),
	ObjectProperties 	= require("interface.objectprop"),
	SceneList			= require("interface.scenelist"),
	SceneProperties		= require("interface.sceneprop"),
	ToolBox 			= require("interface.toolbox"),
	ToolBar 			= require("interface.toolbar"),
	SelectedList		= require("interface.selectedlist"),
	SceneObjects		= require("interface.sceneobjects"),
}

-- Editor user interface instances
Editor.uii = {
	SceneNavigator 		= nil,
	ColorPicker 		= nil,
	ProjectLoader 		= nil,
	GridProperties 		= nil,
	ObjectList 			= nil,
	ObjectProperties 	= nil,
	SceneList 			= nil,
	SceneProperties		= nil,
	ToolBox 			= nil,
	ToolBar 			= nil,
	SelectedList 		= nil,
	SceneObjects 		= nil,
}

-- UI Creation
function Editor.DisplayToolBox()
	Editor.uii.ToolBox = Editor.uic.ToolBox:Create()
end

function Editor.DisplayToolBar()
	Editor.uii.ToolBar = Editor.uic.ToolBar:Create()
end

function Editor.DisplayColorPicker(c, title)
	Editor.uii.ColorPicker = Editor.uic.ColorPicker:Create(c, title)
end

function Editor.DisplaySceneNavigator()
	Editor.uii.SceneNavigator = Editor.uic.SceneNavigator:Create()
end

function Editor.RefreshNav(w, h)
	if Editor.uii.SceneNavigator ~= nil then
		Editor.uii.SceneNavigator:RefreshNav(w, h)
	end
end

function Editor.DisplayProjectLoader()
	Editor.uii.ProjectLoader = Editor.uic.ProjectLoader:Create()
end

function Editor.DisplayGridProperties()
	Editor.uii.GridProperties = Editor.uic.GridProperties:Create()
end

function Editor.DisplayObjectProperties(oList)
	Editor.uii.ObjectProperties = Editor.uic.ObjectProperties:Create(oList)
end

function Editor.UpdateObjectProperties(oList)
	if Editor.uii.ObjectProperties ~= nil then
		Editor.uii.ObjectProperties:UpdateOP(oList)
	end
end

function Editor.UpdateSceneNav(w, h)
	if Editor.uii.SceneNavigator ~= nil then
		Editor.uii.SceneNavigator:RefreshNav(w, h)
	end
end

function Editor.DisplayObjectList(oList)
	Editor.uii.ObjectList = Editor.uic.ObjectList:Create(oList)
end

function Editor.DisplaySceneProperties(scene)
	Editor.uii.SceneProperties = Editor.uic.SceneProperties:Create(scene)
end

function Editor.DisplaySceneList(scenes)
	Editor.uii.SceneList = Editor.uic.SceneList:Create(scenes)
end

function Editor.DisplaySelectedList()
	Editor.uii.SelectedList = Editor.uic.SelectedList:Create()
end

function Editor.UpdateSelectedList()
	if Editor.uii.SelectedList ~= nil then
		Editor.uii.SelectedList:Update(obj)
	end
end

function Editor.DisplaySceneObjects(scene)
	if Editor.uii.SceneObjects == nil then
		Editor.uii.SceneObjects = Editor.uic.SceneObjects:new(scene)
	else
		Editor.uii.SceneObjects:Remove()
	end
end

function Editor.Start()
	print("Starting Editor")
	print("Engine "..Engine.name.." v. "..Engine.version)

	Editor.cam = require("camera.camera"):new(100, 100)
	Engine.cam = Editor.cam
	Editor.window = {w = love.window.getWidth(), h = love.window.getHeight()}
	--DisplayToolBox()
	loveframes.base:SetPos(0, 0)
	loveframes.base:SetWidth(love.window.getWidth())
	loveframes.base:SetHeight(love.window.getHeight())
end

function Editor.Render()
	if Editor.cam.scene == nil and Engine.drawTitle then
		-- Show Engine Name.
		Editor.RenderTitle()
	end

	Editor.cam:Render()

	if Editor.selected ~= nil then
		Editor.RenderSelection()
	end
	-- Display Grid if necessary
	Editor.DisplayGrid()
	loveframes.draw()
end

function Editor.Update( dt )
	if Editor.rtSimulation then
		if Game ~= nil then
			Game.Update(dt)
		end
	end

	love.window.setTitle(Engine.name .." Game Engine v "..Engine.version.." - Camera X: "..Editor.cam.x..", Y:"..Editor.cam.y.." - FPS: "..math.floor(1/dt))

	Editor.updateTranslateMode(dt)

	if Editor.selected ~= nil then
		Editor.UpdateObjectProperties(Editor.selected[1])
	end

	if Editor.rtSimulation then
		Editor.cam:Update(dt)
	end

	if Editor.navigateUsingMiddleMouse and Editor.cam ~= nil then
		if Editor.cam.scene ~= nil then
			Editor.currentNavAcc = Editor.currentNavAcc + dt
			if Editor.currentNavAcc < Editor.navigationSpeed then
				return
			end
			Editor.currentNavAcc = 0
			local x, y = love.mouse.getPosition()

			if Editor.cam.x + Editor.middleMouseClickPos.x - x <= 0 then
				Editor.cam.x = 0
			elseif Editor.cam.x + Editor.middleMouseClickPos.x - x >= Editor.cam.scene.w then
				Editor.cam.x = Editor.cam.w
			else
				Editor.cam.x = Editor.cam.x + Editor.middleMouseClickPos.x - x
			end

			if Editor.cam.y + Editor.middleMouseClickPos.y - y <= 0 then
				Editor.cam.y = 0
			elseif Editor.cam.y + Editor.middleMouseClickPos.y - y >= Editor.cam.scene.h then
				Editor.cam.y = Editor.cam.h
			else
				Editor.cam.y = Editor.cam.y + Editor.middleMouseClickPos.y - y
			end
		end
	end

	-- Updating user interface
	loveframes.update(dt)
end

function Editor.Quit()
	print("Shutting Editor down ..")
end

function Editor.Resize(w, h)
	Editor.window.w = w
	Editor.window.h = h
	loveframes.base:SetWidth(w)
	loveframes.base:SetHeight(h)
end

function Editor.MousePressed(x, y, button)
	-- Look for a clickable object
	if #loveframes.util.GetCollisions() > 1 then
		loveframes.mousepressed(x, y, button)
	else
		if Editor.rtSimulation then
			if Game ~= nil then
				Game.MousePressed(x, y, button)
			end
			return
		end
		-- Is the event happening in realtime simulation?
		if Editor.rtSimulation then
			if Game ~= nil then
				--Game.MousePressed(x, y, button)
			end
		end

		if Editor.cam.scene == nil then
			return
		end
		Engine.debug("Button mouse pressed "..button)
		x = x + Editor.cam.x
		y = y + Editor.cam.y
		if button == "l" then
			Editor.CheckSelection(x, y)	
		-- Scene navigation
		elseif button == "m" then
			Editor.navigateUsingMiddleMouse = true
			Editor.middleMouseClickPos.x = x
			Editor.middleMouseClickPos.y = y
		end
	end
end

function Editor.MouseReleased(x, y, button)
	if #loveframes.util.GetCollisions() > 1 then
		loveframes.mousereleased(x, y, button)
	else
		if Editor.rtSimulation then
			if Game ~= nil then
				Game.MouseReleased(x, y, button)
			end
			return
		end
		--Engine.debug("Button mouse released "..button)
		if button == "l" and Editor.selected ~= nil then
			Editor.UpdateObjectProperties(Editor.selected[1])
			--Editor.ClearSelection()
			Editor.moveSO = false

		elseif button == "m" then
			Editor.navigateUsingMiddleMouse = false
			Editor.middleMouseClickPos.x = 0
			Editor.middleMouseClickPos.y = 0

		elseif button == "r" then
			--Editor.DisplayObjectMenu(x, y)
		end
	end
end

function Editor.KeyPressed(key, unicode)
	if #loveframes.util.GetCollisions() > 1 then
		loveframes.keypressed(key, unicode)
		if key == "f1" then
			Editor.DisplayToolBox()
		
		end
	else
		--Engine.debug("key "..key.." pressed.")
		-- Is the event happening in realtime simulation?
		if Editor.rtSimulation then
			if Game ~= nil then
				Game.KeyPressed(key)
			end
			return
		end

		if key == "f1" then
			Editor.DisplayToolBox()
		elseif key =="f2" then
			Editor.DisplayObjectList(project.data.objects)
		elseif key == "f3" then
			Editor.DisplayObjectProperties(nil)
		elseif key == "f4" then
			Editor.DisplayToolBar()
		end
	end
end

function Editor.KeyReleased(key)
	if #loveframes.util.GetCollisions() > 1 then
		loveframes.keyreleased(key)
	else
		-- Is the event happening in realtime simulation?
		if Editor.rtSimulation then
			if Game ~= nil then
				Game.KeyReleased(key)
			end
			return
		end

		if key == "s" then
			Editor.DisplaySelectedList()
		elseif key == "c" then
			Editor.DisplaySceneObjects(Editor.cam.scene)
		elseif key == "p" then
			Editor.DisplaySceneProperties(Editor.cam.scene)
		elseif key == "delete" then
			Editor.RemoveSelectedObjects()
		end
	end
end

function Editor.TextInput(text)
	loveframes.textinput(text)
end


-- Init game states, etc missing.
function Editor.EnableSimulation()
	Editor.rtSimulation = true
	if Editor.cam.scene ~= nil then
		Editor.cam.scene:Load()
	end
end

function Editor.DisableSimulation()
	Editor.rtSimulation = false
end

-- Editor Modes
function Editor.updateTranslateMode(dt)
	if Editor.moveSO and Editor.selected ~= nil then
		for _, v in ipairs(Editor.selected) do
			if love.keyboard.isDown("x") then
				if Editor.stickToGrid then
					v.x = math.floor((love.mouse.getX() + v.__selectionX + Editor.cam.x) / Editor.gridXUnit) * Editor.gridXUnit
				else
					v.x = love.mouse.getX() + Editor.selectedPos.x + Editor.cam.x
				end
			elseif love.keyboard.isDown("y") then
				if Editor.stickToGrid then
					v.y = math.floor((love.mouse.getY() + v.__selectionY + Editor.cam.y) / Editor.gridYUnit) * Editor.gridYUnit
				else
					v.y = love.mouse.getY() + Editor.selectedPos.y + Editor.cam.y
				end
			else
				if love.keyboard.isDown("lctrl") then
					Editor.stickToGrid = true
				else
					Editor.stickToGrid = false
				end

				if Editor.stickToGrid then
					v.x = math.floor((love.mouse.getX() + v.__selectionX + Editor.cam.x) / Editor.gridXUnit) * Editor.gridXUnit
					v.y = math.floor((love.mouse.getY() + v.__selectionY + Editor.cam.y) / Editor.gridYUnit) * Editor.gridYUnit
				else
					v.x = love.mouse.getX() + v.__selectionX + Editor.cam.x
					v.y = love.mouse.getY() + v.__selectionY + Editor.cam.y
				end
			end
		end
	end
end