--[[
	AssetManager used to make handling assets easier.
	A good asset is organized as follows:

	/assets
		/gui    : user Interface
		/audio  : Audio Music
		/fx     : Sound Effects
		/maps   : Map Objects
		/models : Image Models   
]]

local class = require 'oop.middleclass'

local AssetManager =  class('AssetManager')

function AssetManager:initialize()
	Engine.debug("Creating an instance of the asset manager.")
	self.folder = "assets"
	self.assets = {}
end

function AssetManager:SetAssetFolder( path )
	self.folder = path
end

function AssetManager:Register(name, path)
	local url 
	if project.enginePowered then
		url = "projects/"..project.name.."/"..self.folder.."/"..path
	else
		url = self.folder.."/"..path
	end
	Engine.debug("import asset "..path)
	self.assets[name] = url
end

function AssetManager:ImportSprite(name)
	return love.graphics.newImage(self.assets[name])
end

function AssetManager:ImportFont(name)
	return love.graphics.newImage(self.assets[name])
end


-- This will register all files contained in a dicrectory (and its sub)
-- The given directory must be under the setup assets folder.
function AssetManager:RegisterFromDir(dir)
	local lfs = love.filesystem
	local folder 
	if project.enginePowered then
		folder = "projects/"..project.name.."/"..self.folder .."/"..dir.."/"
	else
		folder = self.folder .."/"..dir.."/"
	end

    local filesTable = lfs.getDirectoryItems(folder)
    print(folder)
    for i,v in ipairs(filesTable) do
        local file = folder.."/"..v
        if lfs.isFile(file) then
            self:Register(v:match("^([^%.]*)%.?"), dir.."/"..v)
        end
    end
end

-- Same but will create objects as well.
function AssetManager:RegisterAndImportSpritesFromDir(dir)
	local objtable = {}
	local lfs = love.filesystem
	local folder 
	if project.enginePowered then
		folder = "projects/"..project.name.."/"..self.folder .."/"..dir.."/"
	else
		folder = self.folder .."/"..dir.."/"
	end

    local filesTable = lfs.getDirectoryItems(folder)
    print(folder)
    for i,v in ipairs(filesTable) do
        local file = folder.."/"..v
        if lfs.isFile(file) then
        	local fname = v:match("^([^%.]*)%.?")
            self:Register(fname, dir.."/"..v)
            local o = require("object.object"):Create(fname, self:ImportSprite(fname), 0, 0)
            table.insert(objtable, o)
        end
    end

    return objtable
end

return AssetManager