--[[ project data that will be displayed in the editor. ]]

project = {
	-- Disable this in release mode
	enginePowered = true, 
	
	name = "untitled",
	version = "0.0.1",
	conf = { },

	data = { 
		scenes =  { }, 
		objects = { },
		fonts =   { },
		audio =   { }, 
	}
}

function project.AddObject(obj)
	table.insert(project.data.objects, obj)
end

function project.AddScene(scene)
	table.insert(project.data.scenes, scene)
end

-- WARNING: Buggy. DO NOT USE.
function project.Clear()
	project = {
		-- Disable this in release mode
		enginePowered = true, 
		
		name = "untitled",
		version = "0.0.1",
		conf = { },

		data = { 
			scenes =  { }, 
			objects = { },
			fonts =   { },
			audio =   { }, 
		}
	}
end

function project.save ()
	for _, v in ipairs(project.data.scenes) do
		v:SaveDefaults()
	end
end

function project.LoadScenes ()
	for _, v in ipairs(project.data.scenes) do
		v:LoadDefaults()
	end
end


function project.ImportControl(ctrl)
	return require("projects."..project.name..".controls."..ctrl.."."..ctrl)
end

function project.ImportObject(obj)
	return require("projects."..project.name..".objects."..obj.."."..obj)
end

function project.ImportScene(scene)
	return require("projects."..project.name..".scenes."..scene.."."..scene)
end

function project.Load(name)
	
	local gameInitFile = "projects/"..name.."/init.lua"
	local oListFile = "projects/"..name.."/olist.lua"
	local gameFile = loadfile(gameInitFile)
	local oList = loadfile(oListFile)
	if gameFile == nil then
		Engine.debug("[ERROR] Unable to find the project.")
	else
		project.name = name
		gameFile()

		if oList ~= nil then
			oList()
		end
	end
	project.LoadScenes()
end